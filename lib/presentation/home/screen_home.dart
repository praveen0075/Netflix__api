// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/api/api.dart';
// import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widget/background_card_widget.dart';
import 'package:netflix/presentation/home/widget/number_title_widget.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}
late Future <List<Movies>> trendingMovies;
late Future <List<Movies>> topRatedMovies;
late Future <List<Movies>> top10RatedMovies;
late Future <List<Movies>> upComingMovies;
late Future <List<Movies>> nowPlaying;

class _ScreenHomeState extends State<ScreenHome> {
  
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    top10RatedMovies = Api().get10TopRatedMovies();
    upComingMovies = Api().getupComingMovies();
    nowPlaying = Api().getNowPlaying();
  }
//  Future fetchDatas() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(children:  [
                      FutureBuilder(future: trendingMovies, builder: (context, snapshot) {
                        if(snapshot.hasError){
                          return const Center(child: CircularProgressIndicator());
                        }else if(snapshot.hasData){
                          return  BackgroundCardWidget(snapshot: snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },),
                      MainTitleCard(title: "Top Rated Movies",type: topRatedMovies),
                      sboxH10,
                      MainTitleCard(title: "Trending Now",type: trendingMovies),
                      sboxH10,
                       NumberTitleWidget(type: top10RatedMovies),
                      sboxH10,
                      MainTitleCard(title: "Up coming Movies",type: upComingMovies),
                      sboxH10,
                      MainTitleCard(title: "Now playing Movies",type: nowPlaying),
                      sboxH10,
                    ]),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://duet-cdn.vox-cdn.com/thumbor/0x0:3151x2048/750x500/filters:focal(1575x1024:1576x1025):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                      width: 70,
                                      height: 70,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    sboxW20,
                                    // Image.asset('assets/images/logo.png',width: 30,height: 30 ,)
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Tv shows",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Movies",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          )
                        : sboxH10,
                  ],
                ),
              );
            }));
  }
}

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
            backgroundColor: const MaterialStatePropertyAll(cwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: cBlack,
        ),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 20, color: cBlack),
        ));
  }
}

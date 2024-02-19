import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/new_and_hot.dart/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot.dart/widget/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}
late Future <List<Movies>> upComingMovies;
late Future <List<Movies>> nowPlaying;

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {

  @override
  void initState() {
    super.initState();
    upComingMovies = Api().getupComingMovies();
    nowPlaying = Api().getNowPlaying();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBar(
                    title: const Text(
                      "New & Hot",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: cwhite),
                    ),
                    actions: const [
                      Icon(
                        Icons.cast,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                    bottom: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: cwhite,
                        labelColor: cBlack,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                            color: cwhite, borderRadius: cRadius20),
                        tabs: const [
                          Tab(
                            text: "🍿Comming soon",
                          ),
                          Tab(
                            text: "👀 Everyone's watching",
                          )
                        ]),
                  ))),
          body: TabBarView(
            children: [
              _buildCommingSoon(),
              _buildEveryoneWatching(),
            ],
          )),
    );
  }

  Widget _buildCommingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return  ComingSoonWidget(index: index,type: upComingMovies,);
        });
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
      return  EveryonesWatchingWidget(index: index,type: nowPlaying,);
    });
  }
}

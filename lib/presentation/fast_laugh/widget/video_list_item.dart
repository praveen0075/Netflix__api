import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/model/movie.dart';

class VideoListItem extends StatefulWidget {
  final int index;

  const VideoListItem({required this.index,super.key});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

late Future <List<Movies>> nowPlaying;

class _VideoListItemState extends State<VideoListItem> {
  String? variable;

  @override
  void initState() {
    super.initState();
    nowPlaying = Api().getNowPlaying();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(future: nowPlaying, builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData){
            return  Container(
              // child: Image.network(snapshot.data![widget.index].backDropPath),
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${Constants.imagePath}${snapshot.data![widget.index].backDropPath}"))),
          // colo: Colors.accents[widget.index % Colors.accents.length],
        );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.volume_off ,color: cwhite,size: 30,))),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const  EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(variable??"https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg"),
                        ),
                      ),
                      const VideoActionWiget(icon: Icons.emoji_emotions, title: 'LOL'),
                      const VideoActionWiget(icon: Icons.add, title: 'My List'),
                      const VideoActionWiget(icon: Icons.share, title: 'Share'),
                      const VideoActionWiget(icon: Icons.play_arrow, title: 'Play'),
                      
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWiget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionWiget({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Column(
        children: [
          Icon(icon,color: cwhite,size: 30,),
          Text(title,style: const TextStyle(color: cwhite,fontSize: 16),),
        ],
      ),
    );
  }
}
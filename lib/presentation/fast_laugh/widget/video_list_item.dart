import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.volume_off ,color: cwhite,size: 30,))),

                  //right side

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage("https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg"),
                        ),
                      ),
                      VideoActionWiget(icon: Icons.emoji_emotions, title: 'LOL'),
                      VideoActionWiget(icon: Icons.add, title: 'My List'),
                      VideoActionWiget(icon: Icons.share, title: 'Share'),
                      VideoActionWiget(icon: Icons.play_arrow, title: 'Play'),
                      
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
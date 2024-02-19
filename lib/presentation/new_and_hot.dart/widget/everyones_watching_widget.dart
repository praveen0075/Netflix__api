
import 'package:flutter/material.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widget/custum_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key, required this.type, required this.index,
  });

   final Future<List <Movies>> type;
   final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: type, builder: (context, snapshot) {
      if(snapshot.hasError){
        return const Center(child: Text("something happpened"),);
      }else if(snapshot.hasData){
        return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        sboxH10,
         Text(
          "${snapshot.data?[index].title}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
          Text(
          "${snapshot.data?[index].overview}",
          style: const TextStyle(color: cGrey),
        ),
        sboxH50,
        // VideoWidget(),
        Stack(
      children: [
          SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                "${Constants.imagePath}${snapshot.data?[index].backDropPath}"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 25,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: cwhite,
                    size: 20,
                  ))),
        ),
      ],
    ),
        sboxH10,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             CustomButtonWidget(
                            icon: Icons.send,
                            text: "Share",
                            iconSize: 25,
                            textSize: 10,
                          ),
                          sboxW10,
                           CustomButtonWidget(
                            icon: Icons.add,
                            text: "My List",
                            iconSize: 30,
                            textSize: 10,
                          ),
                          sboxW10,
                           CustomButtonWidget(
                            icon: Icons.play_arrow,
                            text: "Play",
                            iconSize: 30,
                            textSize: 10,
                          ),
                          sboxW20,
          ],
        )
      ],
    );
      }else{
        return const Center(child: CircularProgressIndicator(),);
      }
    },);
    
    
  }
}

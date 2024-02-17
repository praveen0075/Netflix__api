
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/custum_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        sboxH10,
        Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
         Text(
          "This hit sitcom follows the merry misadvantures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: cGrey),
        ),
        sboxH50,
        VideoWidget(),
        sboxH10,
        Row(
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
  }
}

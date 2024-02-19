import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/home/widget/custum_widget.dart';


class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home.jpg"), fit: BoxFit.cover)),
          ),
        const Positioned(
          bottom: 0,
          left: 50,
          right: 50,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween
              ,
              children: [
                CustomButtonWidget(
                  icon: Icons.add,
                  text: "My List",
                ),
                PlayButtonWidget(),
                CustomButtonWidget(
                  icon: Icons.info,
                  text: "info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
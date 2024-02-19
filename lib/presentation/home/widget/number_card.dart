import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const   NumberCardWidget({super.key,required this.index, required this.snapshot});
  final int index;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 150,
              width: 40,
            ),
            Container(
              width: 150,
              height: 240,
              decoration: BoxDecoration(
                  borderRadius: cRadius10,
                  color: Colors.white,
                  image:  DecorationImage(
                      image: NetworkImage("${Constants.imagePath}${snapshot.data[index].posterPath}"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 8.0,
            strokeColor: cwhite,
            child: Text("${index + 1}",style: const TextStyle(fontSize: 140,decoration: TextDecoration.none,color: cBlack,fontWeight: FontWeight.bold),)))
      ],
    );
  }
}

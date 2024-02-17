import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const   NumberCardWidget({super.key,required this.index});
  final int index;

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://media.themoviedb.org/t/p/w220_and_h330_face/hmHA5jqxN3ESIAGx0jAwV7TJhTQ.jpg"),
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
            child: Text("${index + 1}",style: TextStyle(fontSize: 140,decoration: TextDecoration.none,color: cBlack,fontWeight: FontWeight.bold),)))
      ],
    );
  }
}

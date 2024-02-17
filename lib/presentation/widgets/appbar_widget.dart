import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        sboxW20,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        sboxW20,
      ],
    );
  }
}

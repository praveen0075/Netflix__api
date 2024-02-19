import 'package:flutter/material.dart';
import 'package:netflix/api/constants.dart';
// import 'package:netflix/api/constants.dart';
import 'package:netflix/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key, required this.snapshot, required this.index,
  });

  final AsyncSnapshot snapshot;
  final int index;


  @override
  Widget build(BuildContext context) {  
    return Container(
      width: 150,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: cRadius10,
          color: Colors.white,
          image:  DecorationImage(
              image: NetworkImage("${Constants.imagePath}${snapshot.data[index].posterPath}"),
              fit: BoxFit.cover,filterQuality: FilterQuality.high)
          ),
    );
  }
}

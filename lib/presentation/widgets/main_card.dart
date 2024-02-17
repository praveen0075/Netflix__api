import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {  
    return Container(
      width: 150,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: cRadius10,
          color: Colors.white,
          image: const DecorationImage(
              image: NetworkImage(
                  "https://media.themoviedb.org/t/p/w220_and_h330_face/hmHA5jqxN3ESIAGx0jAwV7TJhTQ.jpg"),
              fit: BoxFit.cover)),
    );
  }
}

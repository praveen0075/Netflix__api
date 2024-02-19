
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,  required this.index, required this.imageurl,
  });
  final int index;
  final String imageurl;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                imageurl),
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
    );
  }
}

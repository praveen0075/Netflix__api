
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/mUYV0ZdsDEliGaQahcQH1F3grsP.jpg"),
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

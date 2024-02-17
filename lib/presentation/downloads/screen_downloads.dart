import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Padding( 
            padding: EdgeInsets.all(8.0),
            child: AppBarWidget(
              title: "Downloads",
            ),
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => sboxH20,
          itemCount: _widgetList.length),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List<String> imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/vBZ0qvaRxqEhZwl6LWmruJqWE8Z.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/hmHA5jqxN3ESIAGx0jAwV7TJhTQ.jpg",
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: cwhite, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        sboxH20,
        const Text(
          "We will download a personlised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          // color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.37,
                backgroundColor: Colors.grey.shade800,
              ),
              DownloadsImageWidgets(
                margin: const EdgeInsets.only(left: 160, bottom: 20),
                imageList: imageList[0],
                angle: 21,
              ),
              DownloadsImageWidgets(
                margin: const EdgeInsets.only(right: 160, bottom: 20),
                imageList: imageList[1],
                angle: -21,
              ),
              DownloadsImageWidgets(
                  margin: const EdgeInsets.only(left: 0),
                  imageList: imageList[2]),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            color: buttonClrBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: cwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        sboxH10,
        MaterialButton(
          onPressed: () {},
          color: buttonClrwhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: cBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });
    
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: cwhite,
        ),
        sboxW10,
        Text("Smart Downloads",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    this.angle = 0,
    required this.margin,
    required this.imageList,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * 0.56,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(imageList), fit: BoxFit.cover),
          // color: Colors.black,
        ),
      ),
    );
  }
}

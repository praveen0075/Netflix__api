import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        const SearchItemTitle(title: "Top Searches"),
        sboxH10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, indext) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => sboxH20,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.37,
          height: 80,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Movie Name",
            style: TextStyle(
                color: cwhite, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )),
        const CircleAvatar(
          backgroundColor: cwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: cBlack,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: cwhite,
            ),
          ),
        )
      ],
    );
  }
}

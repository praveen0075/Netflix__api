import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";

class SearchResutWidget extends StatelessWidget {
  const SearchResutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchItemTitle(title: "Movies & TV"),
        sboxH10,
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                shrinkWrap: true,
                childAspectRatio: 1.1 / 1.6,
                children: List.generate(20, (index) {
                  return const MainCard();
                })))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      image: const DecorationImage(
      image: NetworkImage(
      "https://media.themoviedb.org/t/p/w220_and_h330_face/vBZ0qvaRxqEhZwl6LWmruJqWE8Z.jpg",
      ),
      fit: BoxFit.cover)),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/widget/title.dart';


class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

late Future<List<Movies>> topSearchMovies;

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  void initState() {
    super.initState();
    topSearchMovies = Api().topSearchses();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Top Searches"),
        sboxH10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, indext) =>
                  TopSearchItemTile(type: topSearchMovies,index: indext),
              separatorBuilder: (ctx, index) => sboxH20,
              itemCount: 20),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.type, required this.index});

  final Future<List<Movies>> type;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: type,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("something happpened"),
          );
        } else if (snapshot.hasData) {
          return Row(
            children: [
              Container(
                width: screenWidth * 0.37,
                height: 80,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${Constants.imagePath}${snapshot.data![index].backDropPath}"), fit: BoxFit.cover)),
              ),
               Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${snapshot.data?[index].title}",
                  style: const TextStyle(
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

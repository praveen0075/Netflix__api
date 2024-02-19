import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/widget/title.dart';

// const imageUrl =
    // "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";

// class SearchResutWidget extends StatelessWidget {
//   const SearchResutWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(  
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SearchItemTitle(title: "Movies & TV"),
//         sboxH10,
//         Expanded(
//             child: GridView.count(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 5,
//                 crossAxisSpacing: 5,
//                 shrinkWrap: true,
//                 childAspectRatio: 1.1 / 1.6,
//                 children: List.generate(20, (index) {
//                   return const MainCard();
//                 })))
//       ],
//     );
//   }
// }

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});
    final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      image:  DecorationImage(
      image: NetworkImage(
      "${Constants.imagePath}${movie.posterPath}",
      ),
      fit: BoxFit.cover)),
    );
  }
}
class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV",),
        sboxH10,
        Expanded(
          child: FutureBuilder<List<Movies>>(
            future: Api().searchResult(result),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error loading data"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index];
                    return MainCard(
                      movie: data,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleWidget extends StatelessWidget {
  const NumberTitleWidget({
    super.key, required this.type,
  });

   final Future<List <Movies>> type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitleWidget(title: "Top 10 Tv shows in India"),
        sboxH10,
        FutureBuilder(future: type, builder: (context, snapshot) {
          if(snapshot.hasError){
              return const Center(child: Text("something happpened"),);
            }else if(snapshot.hasData){
              return  LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => NumberCardWidget(index: index, snapshot: snapshot,)),
          ),
        );
              }else{
                 return  const Center(child: CircularProgressIndicator(),);
              }
        },)
       
      ],
    );
  }
}

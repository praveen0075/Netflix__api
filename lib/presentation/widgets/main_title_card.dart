
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatefulWidget {
  final String title;
  const MainTitleCard({
    super.key,
    required this.title, required this.type, 
  });

  final Future<List <Movies>> type;

  

  @override
  State<MainTitleCard> createState() => _MainTitleCardState();
}

class _MainTitleCardState extends State<MainTitleCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitleWidget(title:widget.title,),
        sboxH10,
        FutureBuilder(
          future: widget.type,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return const Center(child: Text("something happpened"),);
            }else if(snapshot.hasData){
              return    LimitedBox(
            maxHeight: 210,
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
                return Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 5),
                child:  MainCardWidget(index: index,snapshot: snapshot),
              );
              }, ),
          );
            }else{
              return  const Center(child: CircularProgressIndicator(),);
            }
          },
       
        )
      ],
    );
  }
}


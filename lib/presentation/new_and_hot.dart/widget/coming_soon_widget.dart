
import 'package:flutter/material.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widget/custum_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key, required this.type, required this.index,
  });

   final Future<List <Movies>> type;
   final int index;

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return FutureBuilder(future: type, builder: (context, snapshot) {
      if(snapshot.hasError){
        return const Center(child: Text("something happpened"),);
      }else if(snapshot.hasData){
        return SizedBox(
      height: 460,
      child: Row(
        children: [
          SizedBox(
            width: size.width,
            // height: 500,
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Stack(
      children: [
         SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                "${Constants.imagePath}${snapshot.data?[index].backDropPath}"),
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
    ),
                 Row(
                    children: [
                      SizedBox(
                        child: Expanded(
                          child: Text(
                            "${snapshot.data?[index].title}",
                            style: const TextStyle(
                                fontSize: 26 ,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2),
                          ),
                        ),
                      ),
                     const  Spacer(),
                  const   Row(
                        children: [
                          CustomButtonWidget(
                            icon: Icons.notifications_active_sharp,
                            text: "Remind me",
                            iconSize: 20,
                            textSize: 10,
                          ),
                          sboxW20,
                          CustomButtonWidget(
                            icon: Icons.info,
                            text: "info",
                            iconSize: 20,
                            textSize: 10,
                          ),
                          sboxW20,
                        ],
                      )
                    ],
                  ),
                  sboxH10,
                   Text("Coming on ${DateFormat("EEEE").format(snapshot.data![index].releaseDate)}"),
                  sboxH10,
                    Text(
                    "${snapshot.data?[index].title}",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                    Expanded(
                      child: Text(
                        "${snapshot.data?[index].overview}",style: const TextStyle(color: cGrey),),
                    )
                ]),
          ),
        ],
      ),
    );
      }else{
         return const Center(child: CircularProgressIndicator(),);
      }
    },);
    
    
  }
}









//one
// class ComingSoonWidget extends StatelessWidget {
//   ComingSoonWidget({
//     super.key, required this.movie,
//   });
//   final Movie movie;
//   final DateFormat monthFormatter = DateFormat('MMM');
//   final DateFormat dayFormatter = DateFormat('dd');
//   final DateFormat dayFormatterDay = DateFormat('EEEE');
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Row(
//       children: [
//          SizedBox(
//           width: 50,
//           height: 500,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//              Text(
//                 monthFormatter.format(DateTime.parse(movie.releaseDate!)).toUpperCase(),
//                 style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold),
//               ),
//                Text(
//                 dayFormatter.format(DateTime.parse(movie.releaseDate!)),
//                 style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 3),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           width: size.width - 50,
//           height: 500,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               VideoWidget(image: movie.posterPath,),
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: size.width-170,
//                     height: 50,
//                     child: Text(
//                       '${movie.title}',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         letterSpacing: -4,
//                         overflow: TextOverflow.fade
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       CustomButtonWidget(
//                         icon: Icons.alarm,
//                         title: 'Remind me',
//                         iconSize: 15,
//                         textSize: 12,
//                       ),
//                       kwidth,
//                       CustomButtonWidget(
//                         icon: Icons.info,
//                         title: 'Info',
//                         iconSize: 15,
//                         textSize: 12,
//                       ),
//                       kwidth
//                     ],
//                   )
//                 ],
//               ),
//               kheight,
//               Text('Coming on ${dayFormatterDay.format(DateTime.parse(movie.releaseDate!))}'),
//               kheight,
//               Text(
//                 '${movie.title}',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               kheight,
//               Text(
//                 '${movie.overview}',
//                 style: TextStyle(color: Colors.grey,overflow: TextOverflow.fade),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

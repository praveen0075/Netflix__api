import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: PageView(
        scrollDirection: Axis.vertical,
        children: 
          List.generate(10, (index){
            return VideoListItem(index: index,);
          })
      )),
    );
  }
}

// class ScreenFastLaugh extends StatelessWidget {
//   const ScreenFastLaugh({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: ValueListenableBuilder(
//                 valueListenable: trendingNowListNotifeir,
//                 builder: (context, value, _) {
//                   return PageView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: value.length,
//                     itemBuilder: (context, index){ 
//                        var data = value[index];
//                       return VideoListItem(
//                         index: index, movie:data,);
//                         }
//                   );
//                 })));
//   }
// }
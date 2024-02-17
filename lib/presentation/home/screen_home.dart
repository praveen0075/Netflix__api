import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/background_card_widget.dart';
import 'package:netflix/presentation/home/widget/number_title_widget.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(children: [
                      BackgroundCardWidget(),
                      MainTitleCard(title: "Released in the past year"),
                      sboxH10,
                      MainTitleCard(title: "Trending Now"),
                      sboxH10,
                      NumberTitleWidget(),
                      sboxH10,
                      MainTitleCard(title: "Tense Dramas"),
                      sboxH10,
                      MainTitleCard(title: "South Indian Cinemas"),
                      sboxH10,
                    ]),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://duet-cdn.vox-cdn.com/thumbor/0x0:3151x2048/750x500/filters:focal(1575x1024:1576x1025):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                      width: 70,
                                      height: 70,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    sboxW20,
                                    Container(
                                      color: Colors.blue,
                                      width: 30,
                                      height: 30,
                                    ),
                                    sboxW20,
                                    // Image.asset('assets/images/logo.png',width: 30,height: 30 ,)
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Tv shows",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Movies",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          )
                        : sboxH10,
                  ],
                ),
              );
            }));
  }
}

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
            backgroundColor: const MaterialStatePropertyAll(cwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: cBlack,
        ),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 20, color: cBlack),
        ));
  }
}

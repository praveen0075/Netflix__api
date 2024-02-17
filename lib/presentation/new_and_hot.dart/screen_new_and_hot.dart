import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot.dart/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot.dart/widget/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBar(
                    title: const Text(
                      "New & Hot",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: cwhite),
                    ),
                    actions: [
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
                    ],
                    bottom: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: cwhite,
                        labelColor: cBlack,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                            color: cwhite, borderRadius: cRadius20),
                        tabs: const [
                          Tab(
                            text: "🍿Comming soon",
                          ),
                          Tab(
                            text: "👀 Everyone's watching",
                          )
                        ]),
                  ))),
          body: TabBarView(
            children: [
              _buildCommingSoon(),
              _buildEveryoneWatching(),
            ],
          )),
    );
  }

  Widget _buildCommingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return const ComingSoonWidget();
        });
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
      return const EveryonesWatchingWidget();
    });
  }
}

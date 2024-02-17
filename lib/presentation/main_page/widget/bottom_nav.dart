import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexchangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexchangeNotifier, builder:(context,int newIndex, _) {
      return  BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index){
        indexchangeNotifier.value = index;
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgrounColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme:const IconThemeData(
        color: Colors.white
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey
      ),
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"Home"),
        BottomNavigationBarItem(icon: Icon(Icons.collections_outlined),label:"New & Hot"),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined),label:"Fast laughs"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
        BottomNavigationBarItem(icon: Icon(Icons.arrow_circle_down_outlined),label:"Downloads"),
      ],
    );
    },);
  }
}
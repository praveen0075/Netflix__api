import 'package:flutter/cupertino.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  const MainTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style:const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    );
  }
}
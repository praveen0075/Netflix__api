
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/custum_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 460,
      child: Row(
        children: [
          const SizedBox(
            // height: 500,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "FEB",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "11",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            // height: 500,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidget(),
                 Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TALL GIRL 2",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2),
                      ),
                      Spacer(),
                      Row(
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
                   Text("Coming on Friday"),
                  sboxH30,
                   Text(
                    "Tall Girl 2",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   Text(
                      "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence -- and her relationship -- into a tailspin.",style: TextStyle(color: cGrey),)
                ]),
          ),
        ],
      ),
    );
  }
}

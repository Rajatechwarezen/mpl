import 'dart:convert';

import 'package:WINNER11/screen/component/darkmode.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/coundown.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';

import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/utilis/AllColor.dart';

import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

import '../../utilis/borderbox.dart';

class Mycontest extends StatefulWidget {
  final data;
  final type;
  const Mycontest({super.key, required this.data, required this.type});

  @override
  State<Mycontest> createState() => _MycontestState();
}

class _MycontestState extends State<Mycontest> {
  @override
  void initState() {
    super.initState();
  }

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = widget.data[index];

       var match_date = item["match_date"];
var match_time = item["match_time"];

Widget buildContainer(String type) {
  if ((type == 'upcomming' && getMatchStatus(1, match_date.toString(), match_time.toString()) != "Match Over") ||
      ((type == 'finsh' || type == 'live') && getMatchStatus(1, match_date.toString(), match_time.toString()) == "Match Over")) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/myContestStatus');
      },
      child: Obx(
        () => Container(
          height: 70,
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
          decoration: BoxDecoration(
            color: themeController.isLightMode.value ? myColorWhite : myColor,
            boxShadow: [themeController.isLightMode.value ? boxdark : boxshadow2],
            border: border,
            borderRadius: boRadiusAll,
          ),
          child: Column(
            children: [
              size10h,
              ImageSelect(Image1: "assets/ball.png", Image2: "assets/ball.png", data: item),
            ],
          ),
        ),
      ),
    );
  } else {
    return SizedBox.shrink();
  }
}

switch (widget.type) {
  case 'upcomming':
    return buildContainer('upcomming');
  case 'finsh':
    return buildContainer('finsh');
  case 'live':
    return buildContainer('live');
  default:
    return SizedBox.shrink();
}}
        );
    
  }

  ImageSelect({Image1, Image2, data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ImageComponentNet(
                              myWidth: 30.0,
                              myheight: 30.0,
                              myImage: data["team_a_img"].toString(),
                            ),
                            size10w,
                            Text(
                              data["team_a_short"].toString(),
                              style: CustomStyles.smallTextStyle,
                            ),
                          ],
                        ),
                        size10h,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          color: data["selected_team"] == data["team_a"]
                              ? myColorGray.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100)),
                      child: data["selected_team"] == data["team_a"]
                          ? Icon(
                              Icons.check,
                              size: 30,
                              color: myColorDarkRed,
                            )
                          : null,
                    ),
                  ),
                ),

                // GestureDetector(
                // onTap: (){
                //    setState(() {
                //      deleteDB(data["id"]);
                //    });

                // },
                // child: Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Icon(Icons.delete, size: 50,),)),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                getMatchStatus(
                  1, // Total seconds until the match starts
                  data["match_date"]
                      .toString(), // Match date (customize it according to your data)
                  data["match_time"].toString(),
                ),
                style: TextStyle(
                  color: myColorRed,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          data["team_b_short"].toString(),
                          style: CustomStyles.smallTextStyle,
                        ),
                        size10w,
                        ImageComponentNet(
                          myWidth: 30.0,
                          myheight: 30.0,
                          myImage: data["team_b_img"].toString(),
                        ),
                      ],
                    ),
                    size10h,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: data["selected_team"] == data["team_b"]
                          ? myColorGray.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100)),
                  child: data["selected_team"].toString() == data["team_b"]
                      ? Icon(
                          Icons.check,
                          size: 30,
                          color: myColorDarkRed,
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

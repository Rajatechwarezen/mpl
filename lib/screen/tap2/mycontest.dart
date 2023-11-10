import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';
import 'package:mplpro/screen/component/coundown.dart';
import 'package:mplpro/screen/component/imageComponet.dart';

import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/utilis/AllColor.dart';

import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';

import '../../utilis/borderbox.dart';

class Mycontest extends StatefulWidget {
  final  data;
  final type;
  const Mycontest({super.key, required this.data, required this.type});

  @override
  State<Mycontest> createState() => _MycontestState();
}

class _MycontestState extends State<Mycontest> {
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    titlebtn(
          HeadName: "MY Contest match",
          context1: context,
          Headno: "See All",
          routes: "/AllShowContest",
        ),
        size10h,
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = widget.data[index];

            var match_date =item["match_date"];  //  jsonDecode(item["data"])["data"]["match_date"];
            var match_time = item["match_time"]; // jsonDecode(item["data"])["data"]["match_time"];
            switch (widget.type) {
                   
                      
              case 'upcomming':
                  
                if (getMatchStatus(
                        1, match_date.toString(), match_time.toString()) !=
                    "Match Over") {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/myContestStatus');
                    },
                    child: Container(
                        height: 70,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        decoration: BoxDecoration(
                            border: border, borderRadius: boRadiusAll),
                        child: Column(children: [
                          size10h,
                          ImageSelect(
                              Image1: "assets/ball.png",
                              Image2: "assets/ball.png",
                              data: item),
                        ])),
                  );
                } else {
                  return Text("");
                }
              
              case 'finsh':

            if (getMatchStatus(
                        1, match_date.toString(), match_time.toString()) ==
                    "Match Over") {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/myContestStatus');
                    },
                    child: Container(
                        height: 70,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        decoration: BoxDecoration(
                            border: border, borderRadius: boRadiusAll),
                        child: Column(children: [
                          size10h,
                          ImageSelect(
                              Image1: "assets/ball.png",
                              Image2: "assets/ball.png",
                              data: item),
                        ])),
                  );
                } else {
                  return Text("");
                }    
                
                  default:
                return Text("");
            }
          },
        ),
      ],
    );
  }


  ImageSelect({Image1, Image2, data}) {
    print(data);
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
                          color: data["selected_team"] == data["team_a_short"]
                              ? myColorGray.withOpacity(0.5)
                              : Colors.transparent,


                          borderRadius: BorderRadius.circular(100)),
                      child: data["selected_team"] == data["team_a_short"]
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
                      color: data["selected_team"] == data["team_a_short"]
                          ? myColorGray.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100)),
                  child: data["selected_team"].toString() ==  data["team_a_short"]
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

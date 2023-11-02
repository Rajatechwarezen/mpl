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
  final List<Map<String, dynamic>> data;
  const Mycontest({super.key, required this.data});

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
        Simpletitlebtn(HeadName: "MY Contest match "),
        size10h,
        GestureDetector(
          onTap: () {
            Get.toNamed('/myContestStatus');
          },
          child: Container(
              height: 70,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
              decoration:
                  BoxDecoration(border: border, borderRadius: boRadiusAll),
              child: Column(children: [
                size10h,
                ImageSelect(
                    Image1: "assets/ball.png",
                    Image2: "assets/ball.png",
                    data: widget.data),
              ])),
        ),
      ],
    );
  }
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
                     
                          ImageComponent(
                            myWidth: 30.0,
                            myheight: 30.0,
                            myImage: "assets/ball.png",
                          ),
                                size10w,
                               Text(
                            "Ind",
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
                        color:  data[0]["teamName"] == "teams1"   ? myColorGray.withOpacity(0.5): Colors.transparent,
                        borderRadius: BorderRadius.circular(100)
                        
                      ),
                      child: data[0]["teamName"] == "teams1"
                          ?  Icon(
                              Icons.check,
                              size: 30,
                              color: myColorDarkRed,
                            )
                          : null,
                    ),
                  ),),
            ],
          ),
        ],
      ),
     SimpleCounter(
            totalSeconds: 7200, // Total seconds until the match starts
            matchDate: '28-oct', // Match date (customize it according to your data)
            matchTime: '02:00 pm', // Match time (customize it according to your data)
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
                            "Ind",
                            style: CustomStyles.smallTextStyle,
                          ),
                               size10w,
                      ImageComponent(
                        myWidth: 30.0,
                        myheight: 30.0,
                        myImage: "assets/ball.png",
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
                        color:  data[0]["teamName"] == "teams2"   ? myColorGray.withOpacity(0.5): Colors.transparent,
                        borderRadius: BorderRadius.circular(100)
                        
                      ),
                      child: data[0]["teamName"] == "teams2"
                          ?  Icon(
                              Icons.check,
                              size: 30,
                              color: myColorDarkRed,
                            )
                          : null,
                    ),
                  ),),
        ],
      ),
    ],
  );
}

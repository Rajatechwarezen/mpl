import 'package:WINNER11/DataGet/liveData.dart';
import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/header/appbar.dart';
import 'package:flutter/material.dart';
import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:get/get.dart';

import '../../utilis/globlemargin.dart';

class LiveScores extends StatefulWidget {
  const LiveScores({super.key});

  @override
  State<LiveScores> createState() => _LiveScoresState();
}

class _LiveScoresState extends State<LiveScores> {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    final RealTimeDataController realTimeDataController =
        Get.put(RealTimeDataController());

    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: CustomAppBar(title: "ALL Live"),
      body: Container(
        margin: GlobleglobleMargin.globleMargin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              size20h,
              Obx(() {
                final matches = realTimeDataController.liveMatches;

                if (matches.isEmpty) {
                  return Text("");
                } else {
                  return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                    children: matches.map((match) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 350,
                          height: 220,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration:  BoxDecoration(
                                  color: themeController.isLightMode.value
                                      ? myColorWhite
                                      : myColor,
                                  boxShadow: [
                                    themeController.isLightMode.value
                                        ? boxshadow2
                                        : boxdark
                                  ],
                                  border: border,
                                  borderRadius: boRadiusAll),
                          child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      '•${match.matchStatus}',
                                      style: CustomStyles.smallTextStyle,
                                    ),
                                    size20w,
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Text(
                                                match.series,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                  "${match.matchTime} : ${match.matchDate}"),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Divider(
                                color: myColorRed,
                                thickness: 1,
                              ),
                              // Row of team 1
                              Row(
                                children: [
                                  size20w,
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        teamheadingscore2(
                                            teamAImg: match.teamAImg,
                                            teamBImg: match.teamBImg,
                                            teamName: match.teamAShort,
                                            teamName2: match.teamBShort,
                                            teamScore: match.teamAScore,
                                            teamScore2: match.teamBScore,
                                            teamOver: match.teamAOver,
                                            teamOver2: match.teamBOver),
                                      ],
                                    ),
                                  ),
                                  size20w,
                                ],
                              ),
                              Divider(
                                color: myColorRed,
                                thickness: 1,
                              ),

                              Row(
                                children: [
                                  Row(
                                    children: [
                                      size20w,
                                      //Aw -
                                      Text(match.favTeam.toString()),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Container(
                                            height: 35,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: boRadius5,
                                              border: border,
                                            ),
                                            child: Center(
                                              child: Text(
                                                match.min.toString(),
                                                style:
                                                    CustomStyles.smallTextStyle,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Container(
                                        height: 35,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: boRadius5,
                                          border: border,
                                        ),
                                        child: Center(
                                          child: Text(
                                            match.max.toString(),
                                            style: CustomStyles.smallTextStyle,
                                          ),
                                        ),
                                      )),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: Text(
                                      truncateText(match.venue, 60),
                                      style: CustomStyles.smallTextStyle,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(match.matchType,
                                          style: CustomStyles.textExternel),
                                      Text(match.matchTime,
                                          style: CustomStyles.textExternel),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

teamheadingscore2({
  teamAImg,
  teamBImg,
  teamName,
  teamName2,
  teamScore,
  teamScore2,
  teamOver,
  teamOver2,
  teamType,
  matchTime,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageComponentNet(
                  myWidth: 40.0, myheight: 40.0, myImage: teamAImg.toString()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(teamName.toString(), style: CustomStyles.smallTextStyle),
                  Text("${teamScore}/${teamOver.toString()}",
                      style: CustomStyles.smallTextStyle),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageComponentNet(
                  myWidth: 40.0, myheight: 40.0, myImage: teamBImg.toString()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(teamName2.toString(),
                      style: CustomStyles.smallTextStyle),
                  Text("${teamScore2}/${teamOver2.toString()}",
                      style: CustomStyles.smallTextStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return text.substring(0, maxLength) + "...";
  }
}


// //live scroller 

// class LiveCo extends StatefulWidget {
//   const LiveCo({super.key});

//   @override
//   State<LiveCo> createState() => _LiveCoState();
// }

// class _LiveCoState extends State<LiveCo> {
//   @override
//   Widget build(BuildContext context) {
//     return  CarouselSlider(
//                     carouselController: _carouselController,
//                     options: CarouselOptions(
//                       height: screenWidth * 0.6,
//                       initialPage: 1,
//                       autoPlay: true,
//                       pageSnapping: true,
//                       aspectRatio: 8 / 9,
//                       pauseAutoPlayInFiniteScroll: true,
//                       autoPlayCurve: Curves.easeInExpo,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       viewportFraction: 1.0,
//                       disableCenter: false,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           _currentSlide = index;
//                         });
//                       },
//                       enlargeStrategy: CenterPageEnlargeStrategy.scale,
//                     ),
//                    );
// }
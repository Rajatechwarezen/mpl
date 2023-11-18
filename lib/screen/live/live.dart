import 'package:WINNER11/screen/header/appbar.dart';
import 'package:flutter/material.dart';
import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

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
 return Scaffold(
      appBar: CustomAppBar(title: "ALL Live"),
      body: Container(
        margin: GlobleglobleMargin.globleMargin,
        child: Column(
          children: [
              
                size20h,
                     
                     Simpletitlebtn(HeadName: "All Live Matche "),
             
                     size20h,
            FutureBuilder<void>(
      future: apiService.userAllLive(uri: "http://apicricketchampion.in/webservices/liveMatchList/20122cd5366e30f0847774c9d7698d30"),
      builder: (context, snapshot) {
           final matches = apiService.liveMatches;
       
         if (matches.isEmpty) {
              return  Text("");
            } else {
              return    Column(
                  children: matches.map((match) {
                    return InkWell(
                      onTap: () {
                      
                      },
                      child: Container(
                        width:  350,
                        height: 220,
                       
                        decoration: BoxDecoration(
                              
                          border: border,
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                        child: Column(
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
                                          teamType: match.matchType,
                                          matchTime: match.matchTime,
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
                                            color:myColorRed,
                                      
                                            border: border,
                                          ),
                                          child: Center(
                                            child: Text(
                                              match.min.toString(),
                                              style: CustomStyles
                                                  .smallTextStyle,
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
                                        color:
                                          myColorRed,
                                      
                                        border: border,
                                      ),
                                      child: Center(
                                        child: Text(
                                          match.max.toString(),
                                          style: CustomStyles
                                              .smallTextStyle,
                                        ),
                                      ),
                                    )),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10),
                                  child: Text(
                                    truncateText(match.venue, 60),
                                    style:
                                        CustomStyles.smallTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
             
            }
      },
    )
 
          ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                   
                    image: DecorationImage(
                      image: NetworkImage(teamAImg.toString()),
                      fit: BoxFit.cover,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(teamName.toString(),
                      style: CustomStyles.textExternel),
                  Text(teamOver.toString(), style: CustomStyles.textExternel),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                   
                    image: DecorationImage(
                      image: NetworkImage(teamBImg.toString()),
                      fit: BoxFit.cover,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(teamName2.toString(),
                      style: CustomStyles.textExternel),
                  Text(teamOver2.toString(),
                      style: CustomStyles.textExternel),
                ],
              ),
            ],
          ),
        ],
      ),
     
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(teamScore, style: CustomStyles.textExternel),
              Text(teamType, style: CustomStyles.textExternel),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(teamScore2, style: CustomStyles.textExternel),
              Text(matchTime, style: CustomStyles.textExternel),
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
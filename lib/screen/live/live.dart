import 'package:flutter/material.dart';
import 'package:mplpro/screen/component/shimmer.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';

class LiveScores extends StatefulWidget {
  const LiveScores({super.key});

  @override
  State<LiveScores> createState() => _LiveScoresState();
}

class _LiveScoresState extends State<LiveScores> {
  @override
  Widget build(BuildContext context) {
  final ApiService apiService = ApiService();

    return FutureBuilder<void>(
      future: apiService.userAllLive(uri: "http://apicricketchampion.in/webservices/liveMatchList/20122cd5366e30f0847774c9d7698d30"),
      builder: (context, snapshot) {
           final matches = apiService.liveMatches;

         if (matches.isEmpty) {
              return Center(
                  child: matches == [] || matches == "[]"
                      ? summer2
                      : Image.asset(
                          'assets/ball.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.contain,
                        ));
            } else {
              return SafeArea(
                child: Scaffold(
                  body: ListView(
                    children: matches.map((match) {
                      return InkWell(
                        onTap: () {
                        
                        },
                        child: Container(
                          width:  330,
                          height: 220,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                 myColorWhite,
                               
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
                                            Text(
                                              match.series,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 9),
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
                  ),
                ),
              );
            }
      },
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
      Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.only(
            left: 10,
          ),
          decoration: BoxDecoration(
           
            image: const DecorationImage(
              image: AssetImage('images/vs1.png'),
              fit: BoxFit.cover,
            ),
          )),
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




class LiveMatch {
  final int matchId;
  final String series;
  final String matchDate;
  final String matchTime;
  final String matchType;
  final String matchStatus;
  final String teamA;
  final String teamAShort;
  final String teamAImg;
  final String venue;
  final dynamic min;
  final dynamic max;
  final dynamic favTeam;
  final String teamAScore;
  final String teamAOver;
  final String teamB;
  final String teamBShort;
  final String teamBImg;
  final String teamBScore;
  final String teamBOver;

  LiveMatch({
    this.min,
    this.max,
    this.favTeam,
    required this.matchId,
    required this.series,
    required this.venue,
    required this.matchDate,
    required this.matchTime,
    required this.matchType,
    required this.matchStatus,
    required this.teamA,
    required this.teamAShort,
    required this.teamAImg,
    required this.teamAScore,
    required this.teamAOver,
    required this.teamB,
    required this.teamBShort,
    required this.teamBImg,
    required this.teamBScore,
    required this.teamBOver,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    return LiveMatch(
      favTeam: json["fav_team"] ?? "-",
      min: json["min_rate"] ?? "0",
      max: json['max_rate'] ?? "0",
      matchId: json['match_id'],
      venue: json['venue'],
      series: json['series'],
      matchDate: json['match_date'],
      matchTime: json['match_time'],
      matchType: json['match_type'],
      matchStatus: json['match_status'],
      teamA: json['team_a'],
      teamAShort: json['team_a_short'],
      teamAImg: json['team_a_img'],
      teamAScore: json['team_a_scores'],
      teamAOver: json['team_a_over'],
      teamB: json['team_b'],
      teamBShort: json['team_b_short'],
      teamBImg: json['team_b_img'],
      teamBScore: json['team_b_scores'],
      teamBOver: json['team_b_over'],
    );
  }
}


String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return text.substring(0, maxLength) + "...";
  }
}

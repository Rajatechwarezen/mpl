import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/component/shimmer.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/screen/tap2/mycontest.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';

import '../component/coundown.dart';

class UpComming extends StatefulWidget {
  const UpComming({super.key});

  @override
  State<UpComming> createState() => _UpCommingState();
}

class _UpCommingState extends State<UpComming> {
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  final ApiService apiService = ApiService();
  final String? id = Get.arguments as String?;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: apiService.userAllDoc(uri: "/user_upcoming_matches"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is still running, display a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If an error occurred, display an error message
              return Text('Error: ${snapshot.error}');
            } else  {
          
      if(snapshot.data != null){
            // Data has been successfully fetched
              final data =(snapshot.data as Map<String, dynamic>)["data"]["result"];
    
                
              // ignore: unnecessary_null_comparison
              return data.toString() != "[]"
                  ? Mycontest(
                      data: data,
                      type: "upcomming",
                    )
                  : const Text("");
      }else{
       return const Text("");
      }
          
            }
          },
        ),
        size20h,
        Simpletitlebtn(HeadName: "Upcomming Matches"),
        size10h,
        FutureBuilder(
          future:
              apiService.userMatchList(data: {"id": id}, uri: '/show_matches'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return showShummer;
              }

              final data = (snapshot.data as Map<String, dynamic>)['data'];
              if (data != null) {
                final result = data["result"];
                if (result != null) {
                  return Container(
                    decoration: BoxDecoration(
                        border: border2, borderRadius: boRadiusAll),
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          final match = result[index];
                          if (getMatchStatus(1, match["match_date"].toString(),
                                  match["match_time"]) ==
                              "Match Over") {
                            return GestureDetector(
                              onTap: () {
                                CustomToaster.showWarning(
                                    context, "Match Match Over that ");
                              },
                              child: Container(
                                  height: 180,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 5, right: 10, left: 10),
                                  decoration: BoxDecoration(
                                      border: border,
                                      borderRadius: boRadiusAll),
                                  child: Container(
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: 30,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/banner.png"),
                                                    fit: BoxFit.fill,
                                                    alignment:
                                                        Alignment.centerRight),
                                              ),
                                              child: Container(
                                                  width: 260,
                                                  child: Text(
                                                    "${match['series']}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))),
                                          const Column(
                                            children: [
                                              Icon(Icons.tv),
                                            ],
                                          ),
                                          const Column(
                                            children: [
                                              Icon(Icons.access_alarm),
                                            ],
                                          )
                                        ],
                                      ),
                                      size10h,
                                      ImageColoum(
                                          Image1: match['match_flag_a'],
                                          Image2: match['match_flag_b'],
                                          short_nameA: match["sort_name_a"],
                                          short_nameB: match["sort_name_b"],
                                          long_nameA: match["team_a"],
                                          long_nameB: match["team_b"],
                                          matchData: match["match_date"],
                                          matchtime: match["match_time"]),
                                      Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            width: 250,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/banner1.png"),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, left: 15.0),
                                              child: Text(
                                                "MEGA ₹1 Core",
                                                style:
                                                    CustomStyles.textExternel,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                  )),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/contList', arguments: {
                                  "poolId": match["match_id"],
                                  "id": id
                                });
                              },
                              child: Container(
                                  height: 180,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 5, right: 10, left: 10),
                                  decoration: BoxDecoration(
                                      border: border,
                                      borderRadius: boRadiusAll),
                                  child: Container(
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: 30,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/banner.png"),
                                                    fit: BoxFit.fill,
                                                    alignment:
                                                        Alignment.centerRight),
                                              ),
                                              child: Container(
                                                  width: 260,
                                                  child: Text(
                                                    "${match['series']}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))),
                                          const Column(
                                            children: [
                                              Icon(Icons.tv),
                                            ],
                                          ),
                                          const Column(
                                            children: [
                                              Icon(Icons.access_alarm),
                                            ],
                                          )
                                        ],
                                      ),
                                      size10h,
                                      ImageColoum(
                                          Image1: match['match_flag_a'],
                                          Image2: match['match_flag_b'],
                                          short_nameA: match["sort_name_a"],
                                          short_nameB: match["sort_name_b"],
                                          long_nameA: match["team_a"],
                                          long_nameB: match["team_b"],
                                          matchData: match["match_date"],
                                          matchtime: match["match_time"]),
                                      Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            width: 250,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/banner1.png"),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, left: 15.0),
                                              child: Text(
                                                "MEGA ₹1 Core",
                                                style:
                                                    CustomStyles.textExternel,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                  )),
                            );
                          }
                        },
                      ),
                    ),
                  );
                } else {
                  return showShummer;
                }
              } else {
                return showShummer;
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator
            } else {
              return showShummer;
            }
          },
        ),
      ],
    );
  }
}

ImageColoum(
    {Image1,
    Image2,
    short_nameA,
    short_nameB,
    long_nameA,
    long_nameB,
    matchData,
    matchtime}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageComponentNet(
                myWidth: 40.0,
                myheight: 40.0,
                myImage: Image1 ?? "",
              ),
              size10w,
              Text(
                short_nameA ?? "",
                style: CustomStyles.smallTextStyle,
              )
            ],
          ),
          size10h,
          Text(
            long_nameA ?? "",
            style: CustomStyles.header3TextStyle,
          )
        ],
      ),
      //  SimpleCounter(
      //           totalSeconds: 1, // Total seconds until the match starts
      //           matchDate: matchData, // Match date (customize it according to your data)
      //           matchTime:matchtime, // Match time (customize it according to your data)
      //         ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              getMatchStatus(
                1, // Total seconds until the match starts
                matchData, // Match date (customize it according to your data)
                matchtime,
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

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                short_nameB ?? "",
                style: CustomStyles.smallTextStyle,
              ),
              size10w,
              ImageComponentNet(
                myWidth: 40.0,
                myheight: 40.0,
                myImage: Image2 ?? "",
              ),
            ],
          ),
          size10h,
          Container(
            alignment: Alignment.bottomRight,
            width: 100,
            child: Text(long_nameB ?? "",
                style: CustomStyles.header3TextStyle,
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    ],
  );
}

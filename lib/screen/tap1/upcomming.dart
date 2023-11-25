import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/screen/tap2/mycontest.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

import '../../banner/banner.dart';
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
    // initDatabase();
  }

  int _currentSlide = 0;
  final ThemeController themeController = Get.put(ThemeController());
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
              return imageShimmer;
            } else if (snapshot.hasError) {
              // If an error occurred, display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data != null) {
                // Data has been successfully fetched
                final data =
                    (snapshot.data as Map<String, dynamic>)["data"]["result"]  ;
if(data != null){
        return Column(
                  children: [
                

               
         
                        titlebtn(
              HeadName: "MY Contest match",
              context1: context,
              Headno: "See All",
              routes: "/AllShowContest",
            ),
            size20h,
                    data.toString() != "[]" 
                        ? Mycontest(
                            data: data,
                            type: "upcomming",
                          )
                        : const Text(""),
                    size10h,
                       ],
                );
           

}else {
              return Text('No match data available');
            }
                  } else {
                return const Text("");
              }
            }
          },
        ),
                         FutureBuilder(
                      future: apiService.userAllDoc(uri: "/user_banner"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError || snapshot.data == null) {
                          return Text(
                              'Error: ${snapshot.error ?? "No data available"}');
                        } else {
                          var banners = (snapshot.data
                              as Map<String, dynamic>)['data']["result"];

                          return BannerAdd(
                              banners: banners, currentSlide: _currentSlide);
                        }
                      },
                    ),
                     
             
      Simpletitlebtn(HeadName: "Upcomming Matches"),
            
            
                FutureBuilder(
                  future: apiService
                      .userMatchList(data: {"id": id}, uri: '/show_matches'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return showShummer;
                      }

                      final data =
                          (snapshot.data as Map<String, dynamic>)['data'];
                      if (data != null) {
                        final result = data["result"];
                        if (result != null) {
                          return Column(
                            children: List.generate(result.length, (index) {
                              final match = result[index];
                              if (getMatchStatus(
                                      1,
                                      match["match_date"].toString(),
                                      match["match_time"]) ==
                                  "Match Over") {
                                return GestureDetector(
                                  onTap: () {
                                    CustomToaster.showWarning(
                                        context, "The Match Is  Over ");
                                  },
                                  child: Obx(() => Container(
                                        height: 180,
                                        margin: EdgeInsets.only(top: 20),
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            right: 10,
                                            left: 10),
                                        decoration: BoxDecoration(
                                          border: border,
                                          color: themeController
                                                  .isLightMode.value
                                              ? myColorWhite
                                              : myColor,
                                          boxShadow: [
                                            themeController.isLightMode.value
                                                ? boxdark
                                                : boxshadow2
                                          ],
                                          borderRadius: boRadiusAll,
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height: 30,
                                                      padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      decoration:
                                                           BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                              themeController
                                                  .isLightMode.value ?  "assets/banner.png" : "assets/banner-dark.png"),
                                                            fit: BoxFit.fill,
                                                            alignment: Alignment
                                                                .centerRight),
                                                      ),
                                                      child: Container(
                                                          width: 260,
                                                          child: Text(
                                                            "${match['series']}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ))),
                                                  const Column(
                                                    children: [
                                                      Icon(Icons.tv),
                                                    ],
                                                  ),
                                                  const Column(
                                                    children: [
                                                      Icon(
                                                          Icons.access_alarm),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              size10h,
                                              ImageColoum(
                                                  Image1:
                                                      match['match_flag_a'],
                                                  Image2:
                                                      match['match_flag_b'],
                                                  short_nameA:
                                                      match["sort_name_a"],
                                                  short_nameB:
                                                      match["sort_name_b"],
                                                  long_nameA: match["team_a"],
                                                  long_nameB: match["team_b"],
                                                  matchData:
                                                      match["match_date"],
                                                  matchtime:
                                                      match["match_time"]),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 250,
                                                    height: 40,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/banner1.png"),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                              top: 10.0,
                                                              left: 15.0),
                                                      child: Text(
                                                        "MEGA ₹1 Core",
                                                        style: CustomStyles
                                                            .textExternel,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
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
                                  child: Obx(() => Container(
                                        height: 180,
                                        margin: EdgeInsets.only(top: 20),
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            right: 10,
                                            left: 10),
                                        decoration: BoxDecoration(
                                          border: border,
                                          color: themeController
                                                  .isLightMode.value
                                              ? myColorWhite
                                              : myColor,
                                          boxShadow: [
                                            themeController.isLightMode.value
                                                ? boxdark
                                                : boxshadow2
                                          ],
                                          borderRadius: boRadiusAll,
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height: 30,
                                                      padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      decoration:
                                                           BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                              themeController
                                                  .isLightMode.value ?  "assets/banner.png" : "assets/banner-dark.png"),
                                                            fit: BoxFit.fill,
                                                            alignment: Alignment
                                                                .centerRight),
                                                      ),
                                                      child: Container(
                                                          width: 260,
                                                          child: Text(
                                                            "${match['series']}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ))),
                                                  const Column(
                                                    children: [
                                                      Icon(Icons.tv),
                                                    ],
                                                  ),
                                                  const Column(
                                                    children: [
                                                      Icon(
                                                          Icons.access_alarm),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              size10h,
                                              ImageColoum(
                                                  Image1:
                                                      match['match_flag_a'],
                                                  Image2:
                                                      match['match_flag_b'],
                                                  short_nameA:
                                                      match["sort_name_a"],
                                                  short_nameB:
                                                      match["sort_name_b"],
                                                  long_nameA: match["team_a"],
                                                  long_nameB: match["team_b"],
                                                  matchData:
                                                      match["match_date"],
                                                  matchtime:
                                                      match["match_time"]),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 250,
                                                    height: 40,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/banner1.png"),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                              top: 10.0,
                                                              left: 15.0),
                                                      child: Text(
                                                        "MEGA ₹1 Core",
                                                        style: CustomStyles
                                                            .textExternel,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                              }
                            }),
                          );

                        } else {
                          return showShummer;
                        }
                      } else {
                        return showShummer;
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
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

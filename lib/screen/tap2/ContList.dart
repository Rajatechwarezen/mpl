import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/component/pop.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/screen/tap/topIndigetor.dart';
import 'package:mplpro/screen/tap1/upcomming.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';

class ContList extends StatefulWidget {
  const ContList({super.key});

  @override
  State<ContList> createState() => _ContListState();
}

class _ContListState extends State<ContList>
    with SingleTickerProviderStateMixin {
  //api argument
  final dynamic data_of_id = Get.arguments as dynamic;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return Scaffold(
        appBar: CustomAppBar(
          title: 'MPL',
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Indigator(currentPage: 1),
              size20h,
              Container(
                margin: GlobleglobleMargin.globleMargin,
                child: titlebtn(
                    HeadName: "Discounted Entry Matches",
                    Headno: "20",
                    Routes: '/',
                    context1: context),
              ),
              Container(
                margin: GlobleglobleMargin.globleMargin,
                height: 800,
                child: FutureBuilder(
                    future: apiService.userMatchList(data: {
                      "id": data_of_id["id"],
                      "match_id": data_of_id["poolId"]
                    }, uri: '/show_pools'),
                    builder: (context, snapshot) {
                    
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        final data =
                            (snapshot.data as Map<String, dynamic>)['data'];

                        if (data != null) {
                          final result = data["result"];

                          if (result != null) {
                            return ListView.builder(
                                itemCount: result.length,
                                itemBuilder: (context, index) {
                                  final match = result[index];

                                  return Container(
                                    child: Column(
                                      children: [
                                        size20h,
                                        RefreshIndicator(
                                          onRefresh: () async {
                                            // here we are refresh indigetor
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed('/myCont',arguments: {
                                                                            "id":
                                                                                data_of_id["id"],
                                                                            "data":
                                                                                result[index],
                                                                          });
                                            },
                                            child: Container(
                                                height: 146,
                                                decoration: BoxDecoration(
                                                    border: border,
                                                    borderRadius: boRadiusAll),
                                                child: Container(
                                                  child: Column(children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 5,
                                                              right: 10,
                                                              left: 10),
                                                      child: Column(children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  " ${match["match_status"].toString()} ",
                                                                  style: CustomStyles
                                                                      .smallTextStyle,
                                                                ),
                                                                size20h,
                                                                Text(
                                                                  "₹${match["winning_prize"]}",
                                                                  style: CustomStyles
                                                                      .header2TextStyle,
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Entry:",
                                                                      style: CustomStyles
                                                                          .smallTextStyle,
                                                                    ),
                                                                    Text(
                                                                      "₹${(int.parse(match["entry_fee"].toString()) * 2).toString()}",
                                                                      style: CustomStyles
                                                                          .textExternelgreen
                                                                          ?.copyWith(
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () async{
                                                                    ApiService
                                                                        apiservice =
                                                                        ApiService();
                                                                    var data =
                                                                        await apiservice
                                                                            .userAllDoc(uri: "/fetch_balance");
                                                                      
                                                                    if (int.parse(data["data"]["balance"].toString()) > 10  ) {
                                                                      Get.toNamed(
                                                                          '/createCont',
                                                                          arguments: {
                                                                            "id":
                                                                                data_of_id["id"],
                                                                            "data":
                                                                                result[index],
                                                                          });
                                                                    }else{
                                                                        CustomToaster.showWarning(context, "Somethisng want wrrog because your balance is not enough");
                                                                   
                                                                      Get.toNamed("/addMoney");
                                                                    }
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        myColorgreen, // Set the button background color to green
                                                                  ),
                                                                  child: Text(
                                                                    '₹${match["entry_fee"].toString()}',
                                                                    style: CustomStyleswhite
                                                                        .headerTextStyle,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 300,
                                                              height: 15,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/line.png"),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "₹2888 sprot left",
                                                                  style: CustomStyles
                                                                      .textExternelgray,
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "₹2888 sprot ",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Roboto1",
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          142,
                                                                          139,
                                                                          139),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                    ),
                                                    // bottom
                                                    size10h,
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            boRadiusAll,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 222, 219, 219),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 5,
                                                              right: 10,
                                                              left: 10),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .first_page,
                                                                size: 10,
                                                              ),
                                                              Text(
                                                                "₹1.2 Lakes  ",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Roboto1",
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            142,
                                                                            139,
                                                                            139),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.trolley,
                                                                size: 10,
                                                              ),
                                                              Text(
                                                                "61%",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Roboto1",
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            142,
                                                                            139,
                                                                            139),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.macro_off,
                                                                size: 10,
                                                              ),
                                                              Text(
                                                                "Upto 20 ",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Roboto1",
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            142,
                                                                            139,
                                                                            139),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return Text('No match data available');
                          }
                        } else {
                          return Text('No data available');
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Scaffold(
                            body: Center(
                                child:
                                    const CircularProgressIndicator())); // Display a loading indicator
                      } else {
                        return Text('Data retrieval is not in progress');
                      }
                    }),
              ),
            ],
          )),
        ));
  }
}

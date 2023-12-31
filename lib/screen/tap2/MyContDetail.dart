import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/ImageMatchDetail.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/header/appbar.dart';
import 'package:WINNER11/screen/tap/topIndigetor.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:WINNER11/utilis/globlemargin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilis/boxSpace.dart';

class MyCont extends StatefulWidget {
  const MyCont({super.key});

  @override
  State<MyCont> createState() => _MyContState();
}

class _MyContState extends State<MyCont> with SingleTickerProviderStateMixin {
  final dynamic argumentsdata = Get.arguments as dynamic;
  late AnimationController _controller;
  final ThemeController themeController = Get.put(ThemeController());
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
    return Scaffold(
        appBar: CustomAppBar(
          title: '',
          actions: [],
        ),
        body: SafeArea(
          child: Container(
            margin: GlobleglobleMargin.globleMargin,
            child: Column(
              children: [
                Container(   
                  decoration: summerImage, 
                  child: Indigator(currentPage: 1)),
                RefreshIndicator(
                  onRefresh: () async {
                    // here we are refresh indigetor
                  },
                  child: SizedBox(
                      height: 300,
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 5, right: 10, left: 10),
                          child: Column(children: [
                            size20h,
                            teamA_B(data:  argumentsdata["data"],
                                Image1:  argumentsdata["data"]['match_flag_a'],
                                Image2:  argumentsdata["data"]["match_flag_b"]),

                            size20h,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Prize Pool ",
                                      style: CustomStyles.smallTextStyle,
                                    ),
                                    size20h,
                                          Column(
  children: [
    Image.asset(
     "assets/cruwn.gif",
      width: 30, // Adjust the width as needed
      height: 30, // Adjust the height as needed
      fit: BoxFit.contain, // Adjust the fit property as needed
    ),
   
    Text(
      "₹${argumentsdata["data"]["winning_prize"]}",
      style:  TextStyle(
  
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto1', // Use the same font family name here
  ),
    ),
  ],
),

                                  ],
                                ),
                              ],
                            ),

                            //line image
                            Row(
                              children: [
                                Container(
                                  width: 300,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/line.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "₹2888 sprot left",
                                      style: CustomStyles.textExternelgray,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "₹2888 sprot ",
                                      style: TextStyle(
                                          fontFamily: "Roboto1",
                                          color: myColorGray,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            ElevatedButton(
                              onPressed: () async {
                                 ApiService apiservice = ApiService();
                                var data = await apiservice.userAllDoc(
                                    uri: "/fetch_balance");
 final store =
                                      await SharedPreferences.getInstance();

                                  final id = store.getString("token");

                                  
                                if (int.parse(
                                        data["data"]["balance"].toString()) >
                                    10) {
                                 

                              
                                    Get.toNamed(
                                                                          '/createCont',
                                                                          arguments: {
                                                                            "id":
                                                                                argumentsdata["id"],
                                                                            "data":
                                                                                argumentsdata["data"],
                                                                          });
                                } else {
                                  CustomToaster.showWarning(context,
                                      "Somethisng want wrrog because your balance is not enough");

                                  Get.toNamed("/addMoney");
                                }
},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    myColorgreen, // Set the button background color to green
                              ),
                              child: Text(
                                'Join Now       ₹${argumentsdata["data"]["entry_fee"].toString()}',
                                style: CustomStyleswhite.headerTextStyle,
                              ),
                            )
                          ]),
                        ),
                        // bottom
                        size10h,
                       ])),
                ),
              ],
            ),
          ),
        ));
  }
}

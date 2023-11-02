import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return Container(
      margin: GlobleglobleMargin.globleMargin,
      alignment: Alignment.center,
      child: Column(
        children: [
          FutureBuilder(
              future: apiService.userAllDoc(data: {}, uri: "/fetch_balance"),
              builder: (context, snapshort) {
                if (snapshort.connectionState == ConnectionState.done) {
                  if (snapshort.hasError) {
                    return Text('Error: ${snapshort.error}');
                  }

                  final data = (snapshort.data as Map<String, dynamic>)['data'];
           
                  if (data != null) {
                    final result = data["balance"];

                    if (result != null) {
                      return Text("₹$result",
                          style: CustomStyles.headerTextStyle);
                    } else {
                      return Text('No match data available');
                    }
                  } else {
                    return Text('No data available');
                  }
                } else if (snapshort.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Display a loading indicator
                } else {
                  return Text('Data retrieval is not in progress');
                }
              }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/addMoney");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  myColorgreen, // Set the button background color to green
            ),
            child: Text(
              'Add Cash',
              style: CustomStyleswhite.headerTextStyle,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Amount Unutilised",
                        style: CustomStyles.textExternel,
                      ),
                      size10w,
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              Text(
                "₹16 ",
                style: CustomStyles.headerTextStyle,
              ),
              size20h,
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Winning",
                        style: CustomStyles.textExternel,
                      ),
                      size10w,
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              Text(
                "₹16 ",
                style: CustomStyles.headerTextStyle,
              ),
              size20h,
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Discount Bonus",
                        style: CustomStyles.textExternel,
                      ),
                      size10w,
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              Text(
                "₹16 ",
                style: CustomStyles.headerTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

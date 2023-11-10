import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/shimmer.dart';
import 'package:mplpro/screen/wallet/walletHestory.dart';
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
    return SingleChildScrollView(
      child: Container(
        margin: GlobleglobleMargin.globleMargin,
        alignment: Alignment.center,
        child: Column(
          children: [
            FutureBuilder(
                future: apiService.userAllDoc(uri: "/fetch_balance"),
                builder: (context, snapshort) {
                  final dynamic data = snapshort.data;
                  if (data != null && data is Map<String, dynamic>) {
                    final dynamic balance = data['data']?['balance'];
                    if (balance != null) {
                      return Text("₹$balance",
                          style: CustomStyles.headerTextStyle);
                    } else {
                      return Text('KYC not available ');
                    }
                  } else {
                    return Text('0',style: CustomStyles.headerTextStyle);
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
                Myhestory(
                  data: [],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

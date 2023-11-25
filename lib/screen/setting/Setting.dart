import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:WINNER11/screen/header/appbar.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import '../../utilis/globlemargin.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
      final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Setting',
      ),
      body: Container(
        margin: GlobleglobleMargin.globleMargin,
        child: Column(children: [
          Column(
            children: [
              Simpletitlebtn(
                HeadName: "Setting",
              ),
              
              ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('KYC', style: CustomStyles.header2TextStyle),
                    size20w,
                    size20w,
                    size20w,
                    size20w,  size20w,
                   
             
                    size20w,
                     ],
                ),
                onTap: () {
                  Get.toNamed('/kyc');
                },
              ),
          
                 ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('Notification', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                  Get.toNamed('/notification');
                  
                },
              ),

              
                 ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('Withdraw', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                  Get.toNamed('/withdraw');
                },
              ),

               ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('History Wallet', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                
    Get.toNamed("/historyWallet");  },
              ),
        ],
          )
        ]),
      ),
    );
  }
}

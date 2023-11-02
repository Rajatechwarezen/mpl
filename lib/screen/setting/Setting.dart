import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
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
                              FutureBuilder(
              future: apiService.userAllDoc(data: {}, uri: "/kyc_user_status_check"),
              builder: (context, snapshort) {
                if (snapshort.connectionState == ConnectionState.done) {
                  if (snapshort.hasError) {
                    return Text('Error: ${snapshort.error}');
                  }

                  final data = (snapshort.data as Map<String, dynamic>)['data'];

                  if (data != null) {
                    final result = data["result"][0]["pan_approval"];
         
                    if (result != null) {
                      return Column(
                        children: [
                                Row(
                      children: [
                      result =="approved"?  Text("Verified",style: CustomStyles.textExternelgreen,) :  Text("Not Verified",style: CustomStyles.textExternel,),
                        Icon(
                          Icons.check,
                          color: myColorgreen,
                        )
                      ],
                    ),
                     
                        ],
                      );
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
        ],
          )
        ]),
      ),
    );
  }
}

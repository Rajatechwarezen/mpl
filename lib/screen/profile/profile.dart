import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';

import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';

class ShowProfile extends StatefulWidget {
  static const routeName = "showProfile";
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    final dynamic data = Get.arguments as dynamic;

  

    if (data != null) {
      final ApiService apiService = ApiService();
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Profile",
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: GlobleglobleMargin.globleMargin,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(' Profile Details  ',
                            textAlign: TextAlign.center,
                            style: CustomStyles.header2TextStyle),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/editProfile");
                        },
                        child: SizedBox(
                          width: 39,
                          height: 39,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: boRadius5,
                              color: myColorRed,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: myColorWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  size20h,
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Align(
                            child: SizedBox(
                              width: 120 * fem,
                              height: 120 * fem,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape
                                      .circle, // Set the shape to circle
                                ),
                                child: ClipOval(
                                  // Clip the image to a circle shape
                                  child: Image.asset(
                                    "assets/ball.png", // Replace with your image URL
                                    fit: BoxFit
                                        .cover, // Adjust the fit based on your requirement
                                  ),
                                ),
                              ),
                            ),
                          ),
                          size20w,
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data["name"] ?? "No Name",
                                    style: CustomStyles.textExternel,
                                  ),
                                ]),
                          ),
                        ],
                      )),
                  size20h,
                  Divider(),
                  Container(
                    margin: GlobleglobleMargin.Margin10V,
                    width: double.infinity,
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: boRadius5,
                  
                      border: Border.all(color: myColorRed),
                    ),
                    child: Column(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: myColorRed,
                            child: Text(
                              "User Deatail",
                              style: CustomStyleswhite.header2TextStyle,
                            ),
                          )
                        ],
                      ),
                      size20h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: CustomStyles.header2TextStyle,
                          ),
                          Text(data["phone"]?? "No Phone", style: CustomStyles.textExternel)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email", style: CustomStyles.header2TextStyle),
                          Text(data["email"]?? "No Email", style: CustomStyles.textExternel)
                        ],
                      )
                    ]),
                  ),
                  size10h,
                  Divider(),
                  size10h,
                  Container(
                    margin: GlobleglobleMargin.Margin10V,
                    width: double.infinity,
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: boRadius5,
                  
                      border: Border.all(color: myColorRed),
                    ),
                    child: Column(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: myColorRed,
                            child: Text(
                              "Bank Deatail",
                              style: CustomStyleswhite.header2TextStyle,
                            ),
                          )
                        ],
                      ),
                      size20h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bank name",
                            style: CustomStyles.header2TextStyle,
                          ),
                          Text(data["bank_name"] ?? "No Name",
                              style: CustomStyles.textExternel)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bank Accuont Number",
                              style: CustomStyles.header2TextStyle),
                          Text(data["account_no"]?? "No Accuont",
                              style: CustomStyles.textExternel)
                        ],
                      )
                    ]),
                  ),
                  size10h,
                  Divider(),
                  size10h,
                  Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: kycItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            margin: GlobleglobleMargin.Margin10V,
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: boRadius5,
                        
                              border: Border.all(color: myColorRed),
                            ),
                            child: ListTile(
                              leading: ImageComponent(
                                  myImage: kycItems[index].imagePath,
                                  myheight: 40.0,
                                  myWidth: 40.0),
                              title: Text(kycItems[index].title),
                              subtitle: Text(kycItems[index].subtitle),
                              trailing: FutureBuilder(
                                  future: apiService.userAllDoc(
                                      data: {}, uri: "/kyc_user_status_check"),
                                  builder: (context, snapshort) {
                                    if (snapshort.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshort.hasError) {
                                        return Text(
                                            'Error: ${snapshort.error}');
                                      }

                                      final data = (snapshort.data
                                          as Map<String, dynamic>)['data'];

                                      if (data != null) {
                                        final result =
                                            data["result"][0]["pan_approval"].toString();

                                        if (result != null) {
                                          return Row(
                                            children: [
                                              Icon(
                                                result == "approved"
                                                    ? Icons.check
                                                    : Icons.close,
                                                color:
                                                    kycItems[index].isVerified
                                                        ? Colors.green
                                                        : Colors.red,
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Text(
                                              'No match data available');
                                        }
                                      } else {
                                        return Text('No data available');
                                      }
                                    } else if (snapshort.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Display a loading indicator
                                    } else {
                                      return Text(
                                          'Data retrieval is not in progress');
                                    }
                                  }),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      // ignore: unnecessary_const
      return const Scaffold(
          body: Center(child: const CircularProgressIndicator()));
    }
  }
}

class CircleIcon extends StatelessWidget {
  var myIcon;

  CircleIcon(this.myIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 255, 203, 59),
      ),
      child: Icon(myIcon, color: Colors.white),
    );
  }
}

//objcet
class KYCItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool isVerified;

  KYCItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.isVerified,
  });
}
// list kyc

List<KYCItem> kycItems = [
  KYCItem(
    imagePath: 'assets/adhar.png',
    title: 'Aadhar Verification',
    subtitle: 'Verify your Aadhar card',
    isVerified: true, // Change to false if not verified
  ),
  KYCItem(
    imagePath: 'assets/pancard.png',
    title: 'PAN Verification',
    subtitle: 'Verify your PAN card',
    isVerified: true, // Change to false if not verified
  ),
  KYCItem(
    imagePath: 'assets/phone.png',
    title: 'Phone Verification',
    subtitle: 'Verify your phone number',
    isVerified: true, // Change to false if not verified
  ),
];

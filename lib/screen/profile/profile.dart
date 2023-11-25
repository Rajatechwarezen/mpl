import 'dart:io';

import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/header/appbar.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';

import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:WINNER11/utilis/globlemargin.dart';
import 'package:image_picker/image_picker.dart';

class ShowProfile extends StatefulWidget {
  static const routeName = "showProfile";

  const ShowProfile({Key? key}) : super(key: key);

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    double fem = MediaQuery.of(context).size.width / 390;
    final dynamic data = Get.arguments as dynamic;

    Future<void> handlePickedImage() async {
      final pickedFile1 = await ImagePicker().pickImage(source: ImageSource.gallery);


      if (pickedFile1 != null) {
        final id = data["id"]; // Replace with the actual user ID
        final url = "/user_img_upload"; // Replace with the actual API endpoint
        setState(() {
          pickedFile = File(pickedFile1.path);
        });

        try {
          final result = await apiService.userImageUpload(
            panImage: pickedFile,
            id: id,
            url: url,
          );
        print("${result} ========================================");
          // Add your logic for handling the API response
          if (result == "ok") {
            print("Image successfully uploaded");
          } else {
            print("Image upload failed");
          }
        } catch (e) {
          print("Error uploading image: $e");
        }
      }
    }

    if (data != null) {
      print(data);

      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: "Profile"),
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
                        child: Text(' Profile Details  ', textAlign: TextAlign.center, style: CustomStyles.header2TextStyle),
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
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 120 * fem,
                                  height: 120 * fem,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: pickedFile    == null
                                ?Image.network(
                                        "https://mplproapi.techwarezen.co/images/${data["image"] == null ? "undefined_1700565942151-screen-0.jpg": data["image"] }",
                                        fit: BoxFit.cover,
                                      )
                                :  Image.file(
                                    pickedFile!,
                                    fit: BoxFit.cover, // Adjust the fit property as needed
                                  ) 
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () async {
                                      final pickedFile = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      await handlePickedImage(
                                          );
                                    },
                                  ),
                                ),
                              ],
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
                              "User Details",
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
                          Text(data["phone"] ?? "No Phone",
                              style: CustomStyles.textExternel)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email", style: CustomStyles.header2TextStyle),
                          Text(data["email"] ?? "No Email",
                              style: CustomStyles.textExternel)
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
                              "Bank Detail",
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
                          Text("Bank Account Number",
                              style: CustomStyles.header2TextStyle),
                          Text(data["account_no"] ?? "No Accuont",
                              style: CustomStyles.textExternel)
                        ],
                      )
                    ]),
                  ),
                  size10h,
                  Divider(),
                  size10h,
                
InkWell(
  onTap: (){
    Get.toNamed("/kyc");
  },
  child:   ListView.builder(
  
    shrinkWrap: true,
  
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
  
        child: Row(
  
          children: [
  
            ImageComponent(
  
              myImage: kycItems[index].imagePath,
  
              myheight: 40.0,
  
              myWidth: 40.0,
  
            ),
  
            SizedBox(width: 10), // Adjust the spacing between the image and text
  
            Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.center,
  
              children: [
  
                Text(kycItems[index].title),
  
                Text(kycItems[index].subtitle),
  
              ],
  
            ),
  
            Expanded(
  
              child: FutureBuilder(
  
                future: apiService.userAllDoc(
  
                  data: {},
  
                  uri: "/kyc_user_status_check",
  
                ),
  
                builder: (context, snapshort) {
  
                  if (snapshort.connectionState == ConnectionState.done) {
  
                    if (snapshort.hasError) {
  
                      return Text('Error: ${snapshort.error}');
  
                    }
  
  
  
                    final data =
  
                        (snapshort.data as Map<String, dynamic>)['data'];
  
                    print(data);
  
  
  
                    if (data != null) {
  
                      final result = data["result"][0]["pan_approval"]
  
                          .toString();
  
  
  
                      if (result != null) {
  
                        return Row(
  
                          children: [
  
                            Icon(
  
                              result == "approved"
  
                                  ? Icons.check
  
                                  : Icons.close,
  
                              color: kycItems[index].isVerified
  
                                  ? Colors.green
  
                                  : Colors.red,
  
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
  
                    return  showShummer2;
  
                  } else {
  
                    return Text('Data retrieval is not in progress');
  
                  }
  
                },
  
              ),
  
            ),
  
          ],
  
        ),
  
      );
  
    },
  
  ),
)



                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
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
 
];

 
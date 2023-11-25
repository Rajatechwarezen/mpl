import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/screen/header/appbar.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:WINNER11/utilis/globlemargin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/profileContainer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //api call variable

  final formKey = GlobalKey<FormState>();
    final formKey2 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // bank deatail
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();

  TextEditingController ifscCodeController = TextEditingController();


  void dispose() {
  nameController.dispose();
  phoneController.dispose();
  emailController.dispose();
  // Dispose other controllers

//bank

  bankNameController.dispose();
  bankAccountController.dispose();
  ifscCodeController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "Edit Profile "),
        body: SingleChildScrollView(
          child: Column(
            children: [
                Form(
                key: formKey,
                child: Container(
                  margin: GlobleglobleMargin.globleMargin,
                  height: 500,
                  child: Column(
                    children: [
                      size20h,
                      size20h,
                      Simpletitlebtn(
                        HeadName: "Edit Profile",
                      ),

                      size20h,
                        Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: myColorRed,
                            child: Text(
                              "User Detail",
                              style: CustomStyleswhite.header2TextStyle,
                            ),
                          )
                        ],
                      ),
              
                      myFunctionInput(
                        nameController,
                        "Name",
                        "Your Name",
                        TextInputType.text,
                        "Please enter your Name",
                      ),
                      size20h,
                      myFunctionInput(
                        phoneController,
                        "Phone Number",
                        "+91 1234567890",
                        TextInputType.number,
                        "Please enter a valid Phone Number ",
                      ),

                      size20h,
                      myFunctionInput(
                        emailController,
                        "Email",
                        "example@example.com",
                        TextInputType.emailAddress,
                        "Please enter a valid email",
                      ),
                      //Bnak Deatial
                      size20h,



                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            callApi(
                              context: context,
                              nameController: nameController.text,
                              emailController: emailController.text,
                              phoneController: phoneController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              myColorgreen, // Set the button background color to green
                        ),
                        child: Text(
                          'Save Profile',
                          style: CustomStyleswhite.headerTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Form(
                key: formKey2,
                
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
                          myFunctionInput(
                        bankNameController,
                        "Bank Name",
                        "SBI",
                        TextInputType.text,
                        "Please enter a valid IFSC code",
                      ),
                      size20h,
                      myFunctionInput2(
                        bankAccountController,
                        "Bank Account",
                        "XXXXXXXXXXX",
                        TextInputType.number,
                        "Please enter a valid Bank Account ",
                      ),

                      size20h,
                      myFunctionInput(
                        ifscCodeController,
                        "IFSC Code",
                        "ABCD0123456",
                        TextInputType.text,
                        "Please enter a valid IFSC code",
                      ),
                      size20h,


                      
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey2.currentState!.validate()) {
                            callApi2(
                              context: context,
                              bankNameController: bankNameController.text,
                              bankAccountController: bankAccountController.text,
                              ifscCodeController: ifscCodeController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              myColorgreen, // Set the button background color to green
                        ),
                        child: Text(
                          'Save',
                          style: CustomStyleswhite.headerTextStyle,
                        ),
                      ),
                   
              ],))
            ],
          ),
        ),
      ),
    );
  }
}

callApi(
    {context,
    nameController,
    emailController,
    phoneController,
   }) async {
  ApiService apiService = ApiService();
  final store = await SharedPreferences.getInstance();
  var id = store.getString("userId");

  var editData = {
    "id": id.toString(),
    "name": nameController,
    "email": emailController
  };

 

  var dataProfile =
      apiService.userallType(uri: "/user_update_profile", data: editData);
      
  if (dataProfile != "nodata" ) {
    CustomToaster.showSuccess(context, "Profile Eidit Successfully ");
    Get.toNamed("/home", arguments: id);
  } else {
    CustomToaster.showWarning(context, "Something wrrog  ");
  }
}

callApi2({
  context,
   bankAccountController,
    ifscCodeController,
    bankNameController
}) async {

  ApiService apiService = ApiService();
  final store = await SharedPreferences.getInstance();
  var id = store.getString("userId");

   var editDataBank = {
    "id": id.toString(),
    "account_no": bankAccountController,
    "ifsc_code": ifscCodeController,
    "bank_name": bankNameController
  };
  print("---------------$editDataBank---------");

  var bankProfile =
      apiService.userallType(uri: "/add_bank_account", data: editDataBank);
      
  if ( bankProfile != "nodata") {
    CustomToaster.showSuccess(context, "Profile Eidit Successfully ");
    Get.toNamed("/home", arguments: id);
  } else {
    CustomToaster.showWarning(context, "Something wrrog  ");
  }
}
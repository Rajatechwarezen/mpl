import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // bank deatail
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();

  TextEditingController ifscCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "EditProfile "),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              margin: GlobleglobleMargin.globleMargin,
              height: 900,
              child: Column(
                children: [
                  size20h,
                  size20h,
                  Simpletitlebtn(
                    HeadName: "Edit Profile",
                  ),
                  size20h,
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

                  myFunctionInput(
                    bankNameController,
                    "Bank Name",
                    "SBI",
                    TextInputType.text,
                    "Please enter a valid IFSC code",
                  ),
                  size20h,
                  myFunctionInput(
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
                      if (formKey.currentState!.validate()) {
                        callApi(
                            nameController: nameController,
                            bankAccountController: bankNameController,
                            emailController: emailController,
                            ifscCodeController: ifscCodeController);
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
        ),
      ),
    );
  }
}

callApi(
    {context,
    nameController,
    emailController,
    bankAccountController,
    ifscCodeController,
    bankNameController}) async {
  ApiService apiService = ApiService();
  final store = await SharedPreferences.getInstance();
  var id = store.getString("userId");
  Get.toNamed("/home", arguments: id);
  var editData = {
    "id": id,
    "name": nameController.text,
    "email": emailController.text
  };

  var editDataBank = {
    "id": id,
    "account_no": bankAccountController.text,
    "ifsc_code": ifscCodeController.text,
    "bank_name": bankNameController.text
  };

  apiService.userallType(uri: "/user_update_profile", data: editData);
  apiService.userallType(uri: "/add_bank_account", data: editDataBank);

  CustomToaster.showSuccess(context, "Profile Eidit Successfull ");
}

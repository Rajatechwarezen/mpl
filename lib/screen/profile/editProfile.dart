import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
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
                          context: context,
                            nameController: nameController.text,
                               emailController: emailController.text,
                           phoneController:phoneController.text,
                            bankNameController:bankNameController.text,
                           bankAccountController: bankNameController.text,
                            ifscCodeController: ifscCodeController.text,
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
    bankAccountController,
    ifscCodeController,
    bankNameController}) async {
  ApiService apiService = ApiService();
  final store = await SharedPreferences.getInstance();
  var id = store.getString("userId");

  var editData = {
    "id": id.toString(),
    "name":nameController,
    "email": emailController
  };

  var editDataBank = {
    "id": id.toString(),
    "account_no":bankAccountController,
    "ifsc_code":ifscCodeController,
    "bank_name": bankNameController
  };

   var dataProfile = apiService.userallType(uri: "/user_update_profile", data: editData);
  var bankProfile = apiService.userallType(uri: "/add_bank_account", data: editDataBank);
if(dataProfile !=  "nodata" && bankProfile !=  "nodata" ){
    
   CustomToaster.showSuccess(context, "Profile Eidit Successfull ");
   Get.toNamed("/home", arguments: id);
}else{
     CustomToaster.showWarning(context, "Something wrrog  ");
}
 
}

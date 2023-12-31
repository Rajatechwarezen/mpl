import 'package:WINNER11/screen/component/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/utilis/alinement.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:WINNER11/utilis/globlemargin.dart';

import '../../utilis/AllColor.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await contractionDeviceInfo(context);
    });
  }

  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool agreeToTerms = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: GlobleglobleMargin.globleMargin,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: AlignmentStartCross,
              children: [
                // TopHeaderPopup(),
                size20h,
                size20h,
                size20h,
                size20h,
                size20h,
                size20h,
                size20h,
                Column(
                  crossAxisAlignment: AlignmentStartCross,
                  children: [
                    Text("Sign up on WINNER11 App",
                        style: CustomStyles.headerTextStyle),
                    size10h,
                    Text("Get 50 Coins on  Sign up",
                        style: CustomStyles.smallTextStyle),
                  ],
                ),
                Column(
                  crossAxisAlignment: AlignmentStartCross,
                  children: [
                    size10h,
                    size10h,
                    size20h,
                    size20h,
                    Text("Login using Mobile Number",
                        style: CustomStyles.header2TextStyle),
                    size10h,
                    size10h,
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: myColor!,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: myColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: myColor!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: myColor!),
                        ),
                        hintText: 'Enter your phone number',
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Phone Number';
                        }

                        // Check for Indian phone number format
                        if (RegExp(r'^(\+91[\s-]?)?[789]\d{9}$')
                            .hasMatch(value)) {
                          return null; // Valid Indian phone number
                        }

                        // Check for international phone number format
                        if (!RegExp(
                                r'^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }

                        // If none of the conditions are met, return null (no error)
                        return null;
                      },
                    ),
                    size10h,
                    size10h,
                    _buildLoginBtn(
                        context: context,
                        phController: phoneController,
                        name: 'LOGIN',
                        colors: myColorRed),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginBtn({context, phController, name, Color? colors}) {
    return GestureDetector(
      onTap: () async {
        var pattern =
            r'^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
        RegExp regex = RegExp(pattern);

        if (!regex.hasMatch(phController.text)) {
          CustomToaster.showWarning(context, "Warning message Invalid Phone");
        } else {
          Get.toNamed("/otp", arguments: phController.text.toString());
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.5),
        width: double.infinity,
        child: Text(
          name,
          style: CustomStyleswhite.headerTextStyle,
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            isChecked = newValue!;
          });
        },
      ),
    );
  }
}

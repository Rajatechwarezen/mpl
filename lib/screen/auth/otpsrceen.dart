// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:mplpro/DataGet/formGet.dart';
import 'package:mplpro/routes/Api.dart';
import 'package:mplpro/screen/component/custom_toaster.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/authapi.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var code = "";
  final themeSMS = Get.put(SmsController());
  //api
  final ApiService apiService = ApiService();
  
  @override
  Widget build(BuildContext context) {
    final String? data = Get.arguments as String?;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: myColorRed, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: myColorWhite),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: myColorRed),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: myColorWhite,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ball.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 4,
                showCursor: true,
                onCompleted: (pin) {
                  code = pin;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: myColorRed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      //json decode

                      final store = await SharedPreferences.getInstance();
                      try {
                        var otp = generateOTP();

                        //Api Function
                        var validate = data;

                        // if (code == themeSMS.sendSMS(validate!, otp)) {
                        if (code != otp) {
                          // ctreate user with login
                          final loginData = {"phone": "$data", "otp": "${otp}"};

                          //Send reponse data  thourgh api /user_Login

                          final loginResponse = await apiService.userPostAllApi(
                              data: loginData, uri: '/user_Login');

                          if (loginResponse["status"] == "200") {
                            //here we decode userID thorugh the jwt

                            Map<String, dynamic> decodedToken =
                                Jwt.parseJwt(loginResponse["data"]["token"]);

                            CustomToaster.showSuccess(context,
                                " Successfull  User Login${decodedToken["userId"].toString()}");
                            // we save data in local storage  userId
                            store.setString(
                                'userId', decodedToken["userId"].toString());
                           // we save data in local storage  token
                                  store.setString(
                                'token', loginResponse["data"]["token"]);
                            Get.offAllNamed("/home",arguments: store.getString("userId"));
                            
                          } else {
                            CustomToaster.showWarning(
                                context, " Warning  User Not  Login");
                            Get.offAllNamed("/login");
                          }
                        } else {
                          Get.toNamed("/otp");
                          CustomToaster.showWarning(
                              context, " unauthorized User");
                        }

                      } catch (e) {
                        print("password is woeng$e ");
                      }
                    },
                    child: Text("Verify Your Phone OTP")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: myColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

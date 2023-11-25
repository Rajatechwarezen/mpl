import 'dart:async';

import 'package:WINNER11/screen/component/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/globlemargin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilis/AllColor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _splashDelay = 3000;
  late AnimationController _animationController;

 String? allreadyExit;
  String? Intro;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.forward();
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await contractionDeviceInfo(context);
    });
    _loadWidget();
  }

  
  _loadWidget() async {
        final store = await SharedPreferences.getInstance();
    allreadyExit = store.getString('userId');
    Intro = store.getString('into');
    var duration = Duration(milliseconds: _splashDelay);
   
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    if (Intro == "0" || Intro == null) {
     Get.offNamed("/intro"); 
    } else {
      final store = await SharedPreferences.getInstance();
      allreadyExit  != null ?   Get.offNamed("/home",arguments: store.getString("userId"))  : Get.offNamed("/login"); 
    }
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorRed,
      body: Stack(
        children: [
                 SafeArea(
            child: Center(
              child: Container(
                
                width: 200,
                height: 200,
                child: Center(
                  child: ScaleTransition(
                    scale: _animationController,
                    child: Column(
                      children: [
                        Container(
      margin: GlobleglobleMargin.Margin10R,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/splash.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: boRadiusAll,
     
      ),
      height: 150, // Set the height as needed
      width:160, // Set the width as needed
    ),
                       ],
                    )
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


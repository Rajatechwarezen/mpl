import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';

import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/globlemargin.dart';
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
      initDatabase();
   
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
          image: AssetImage("assets/ball.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: boRadiusAll,
     
      ),
      height: 70, // Set the height as needed
      width: 70, // Set the width as needed
    ),
                       DefaultTextStyle(style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'Roboto1',fontWeight: FontWeight.w900),
                       child: Text("MPLPRO")),
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


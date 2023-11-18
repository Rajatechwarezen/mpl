import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WINNER11/routes/allRoutes.dart';

import 'package:get/get.dart';
import 'package:WINNER11/utilis/AllColor.dart';

import 'screen/component/darkmode.dart';

void main() {
       SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor:myColorRed,
  statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light, // You can adjust the brightness
    ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  final ThemeController themeController = Get.put(ThemeController());

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return Obx(
      () => GetMaterialApp(
        themeMode: themeController.currentThemeMode.value,
        theme: themeController.currentThemeData,
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        getPages: allRutes,
        title: 'WINNER11',
          builder: (context, child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child!,
    );
   },

      ),
    );
  }
}

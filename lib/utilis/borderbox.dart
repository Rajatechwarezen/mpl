
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/darkmode.dart';
import 'package:mplpro/utilis/AllColor.dart';

BorderRadius boRadiusAll = const BorderRadius.all(
  Radius.circular(10),
);


BorderRadius boRadius5 = const BorderRadius.all(
  Radius.circular(5),
);

////////////////////////////Border
Border border = Border.all(
  color: myColorGray,
  width: 0.5,
  style: BorderStyle.solid,
);
Border borderRed = Border.all(
  color: myColorRed,
  width: 0.5,
  style: BorderStyle.solid,
);
  final ThemeController themeController = Get.put(ThemeController());
Border borderB =  const Border(
      bottom: BorderSide(
      
        width: 0.5,
        style: BorderStyle.solid,
      ),);

Border borderT =  const Border(
      top: BorderSide(
      
        width: 0.5,
        style: BorderStyle.solid,
      ),);
var boxshadow = BoxShadow(
  color:  themeController.isLightMode.value ? myColorGray: myColor2,
  blurRadius: 6.0,
  spreadRadius: 2.0,
  offset: Offset(0.0, 0.0),
);

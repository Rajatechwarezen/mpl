import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:flutter/material.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:get/get.dart';

import '../../utilis/AllColor.dart';
import '../../utilis/fontstyle.dart';

myFunction({myColor, text, textColor}) {

  return Container(
    padding: EdgeInsets.all(5),
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: boRadius5,
      boxShadow: [boxshadow],
      color: myColorWhite,
      border: Border.all(color: myColorRed),
    ),
    alignment: Alignment.center,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: textColor,
          child: Text(text, )),
      ],
    ),
  );
}


  final ThemeController themeController = Get.put(ThemeController());
Widget myFunctionInput(
  TextEditingController controller,
  String fieldName,
  String hintText,
  TextInputType inputType,
  String errorMessage,
) {
  return Obx(()=> Container(
    width: 400,
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: themeController.isLightMode.value ? myColorWhite :myColor  ,
      border: borderRed,
      borderRadius: boRadiusAll,
      boxShadow: [boxshadow],
    ),
    child: TextFormField(
      decoration: InputDecoration(
        
        hintText: fieldName,
      ),
      controller: controller,
      onChanged: (newValue) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $fieldName';
        }
        return null;
      },
      textAlign: TextAlign.start,
      keyboardType: inputType,
      style: CustomStyles.smallTextStyle,
      autofocus: true,
      cursorColor: myColor,
    ),
  )
);}

Widget myFunctionInput2(
  TextEditingController controller,
  String fieldName,
  String hintText,
  TextInputType inputType,
  String errorMessage,
) {
  return Obx(() => Container(
        width: 400,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: themeController.isLightMode.value ? myColorWhite : myColor,
          border: borderRed,
          borderRadius: boRadiusAll,
          boxShadow: [boxshadow],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          controller: controller,
          onChanged: (newValue) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $fieldName';
            }
            
            // Add additional validation for bank account number
            if (isValidBankAccount(value)) {
              return 'Please enter a valid $fieldName';
            }

            return null;
          },
          keyboardType: inputType,
          style: CustomStyles.smallTextStyle,
          autofocus: true,
          cursorColor: myColor,
        ),
      ));
}

bool isValidBankAccount(String value) {
  // Implement your custom validation logic for the bank account number
  // Return true if the bank account number is considered valid, otherwise false
  // Example: Check for a specific length, format, or any other criteria
  return value.length == 12; // Modify this according to your requirements
}

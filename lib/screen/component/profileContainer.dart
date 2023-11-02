import 'package:flutter/material.dart';
import 'package:mplpro/utilis/borderbox.dart';

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
        Text(text, style: textColor),
      ],
    ),
  );
}

Widget myFunctionInput(
  TextEditingController controller,
  String fieldName,
  String hintText,
  TextInputType inputType,
  String errorMessage,
) {
  return Container(
    width: 400,
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: myColorWhite,
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
  );
}


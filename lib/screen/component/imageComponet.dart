  import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
ImageComponent({dynamic myWidth, dynamic myheight,myImage}){
  return    Container(
                          width: myWidth ,
                          height: myheight ,
                          decoration: BoxDecoration(
                           image:  DecorationImage(
                        image: AssetImage(myImage),
                        fit: BoxFit.contain,
                        alignment: Alignment.centerRight),
                         
                          ),
                           );
  }
ImageComponentNet({dynamic myWidth, dynamic myheight, myImage}){
  return    Container(
                          width: myWidth ,
                          height: myheight ,
                          decoration: BoxDecoration(
                           image:  DecorationImage(
                        image: NetworkImage(myImage),
                        fit: BoxFit.contain,
                        alignment: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(50),
                          ),
                           );
  }

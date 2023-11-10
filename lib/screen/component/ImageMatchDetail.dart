import 'package:flutter/material.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';

teamA_B({Image1, Image2 , data}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageComponentNet(
                myWidth: 30.0,
                myheight: 30.0,
                myImage: Image1,
              ),
              size10w,
            DefaultTextStyle(
 style: CustomStyles.smallTextStyle,
                child: Text(
                  data["sort_name_a"],
                 
                ),
              )
            ],
          ),
          size10h,
         DefaultTextStyle(
           style: CustomStyles.smallTextStyle,
child: Text(data["team_a"]))
        ],
      ),
    
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
            DefaultTextStyle(

                 style: CustomStyles.smallTextStyle,
                child: Text(
                   data["sort_name_b"],
                 
                ),
              ),
              size10w,
              ImageComponentNet(
                myWidth: 30.0,
                myheight: 30.0,
                myImage:Image2,
              ),
            ],
          ),
          size10h,
       DefaultTextStyle(
 style: CustomStyles.smallTextStyle,
child: Text(data["team_a"]))
        ],
      ),
    ],
  );
}

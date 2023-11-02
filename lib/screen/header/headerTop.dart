
import 'package:flutter/material.dart';
import 'package:mplpro/utilis/fontstyle.dart';

import '../../utilis/AllColor.dart';

titlebtn(
    {required String HeadName,
    String,
    required BuildContext context1,
    required Headno,
    required Routes}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 24,
        child: Column(
          children: [
            Row(
              
              children: [
                Text(
                  HeadName,
                  style:CustomStyles.headerTextStyle,
                ),
              
              ],
            ),
          ],
        ),
      ),
        Text("($Headno)")
    ],
  );
}


Simpletitlebtn(
    {required String HeadName,
 
  }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 24,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  HeadName,
                  style:CustomStyles.header2TextStyle,
                ),
               
              ],
            ),
          ],
        ),
      ),
    ],
  );
}




// here is using titel button 

class TopHeaderPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
         
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                IconButton(
                  icon:  Icon(
                    Icons.arrow_back,
                    color: myColor!, // Close button color
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                ),
              ],
            ),
          ),
      
        ],
      );
    
  }
}


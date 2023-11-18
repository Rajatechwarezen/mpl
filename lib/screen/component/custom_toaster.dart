import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

class CustomToaster {
  static void showSuccess(BuildContext context, String message) {
    _showToast(context, message, Colors.green);
  }

  static void showWarning(BuildContext context, String message) {
    _showToast(context, message, Colors.orange);
  }

  static void _showToast(BuildContext context, String message, Color color) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: DefaultTextStyle(style: CustomStyles.smallTextStyle,
        child: Text(message)),
        backgroundColor: color,
      ),
    );
  }
}


//networking 
showDialogBox(context,isAlertSet,setState,isDeviceConnected) => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: DefaultTextStyle(style:  CustomStyles.smallTextStyle,
          child: const Text('No Connection')),
          content:
      Text('Please check your internet connectivity',style: CustomStyles.smallTextStyle,),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox(context,isAlertSet,setState,isDeviceConnected);
                  setState(() => isAlertSet = true);
                }
              },
              child:  Text('OK',   style : CustomStyles.smallTextStyle,) 
            ),
          ],
        ),
      );
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

class MyNotificationEnable extends StatefulWidget {
  const MyNotificationEnable({super.key});

  @override
  State<MyNotificationEnable> createState() => _MyNotificationEnableState();
}

class _MyNotificationEnableState extends State<MyNotificationEnable> {
  @override
  Widget build(BuildContext context) {
    var forAndroid = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListTile(
          trailing: Switch(
            // thumb color (round icon)
            activeColor: myColorRed,
            activeTrackColor: Colors.cyan,
            inactiveThumbColor: Colors.blueGrey.shade600,
            inactiveTrackColor: Colors.grey.shade400,
            splashRadius: 50.0,
            // boolean variable value
            value: forAndroid,
            // changes the state of the switch
            onChanged: (value) => setState(() => forAndroid = value),
          ),
          leading:
              Icon(Icons.info), // Change the icon to a different policy icon
          title: Row(
            children: [
              Text('Notification All update ',
                  style: CustomStyles.header2TextStyle),
            ],
          ),
        ),
      ),
    );
  }
}

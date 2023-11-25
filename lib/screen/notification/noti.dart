import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:WINNER11/utilis/globlemargin.dart';

import '../header/appbar.dart';

class MyNoti extends StatefulWidget {
  const MyNoti({super.key});

  @override
  State<MyNoti> createState() => _MyNotiState();
}

class _MyNotiState extends State<MyNoti> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Notification',
        ),
        body: SafeArea(
          child: Container(
            margin: GlobleglobleMargin.globleMargin,
            child: Column(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    // here we are refresh indigetor
                  },
                  child: Column(children: [
             
                    size20h,
                    Container(
                      child: NotificationItem(
                        content:
                            "My first nitification  we check to how it is look like",
                        title: '',
                        timestamp: DateTime.now(),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String content;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.content,
    required this.timestamp,
  });

  final ApiService apiService = ApiService();
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
  return FutureBuilder(
  future: apiService.userallGet(
   
    uri: "/notification_get_user",
  ),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      final data = (snapshot.data as Map<String, dynamic>)['data'];



      if (data != null) {
       var result =  data["result"];
     
        if (result != null) {
      
    
          return 
            ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item =result[index];
        return      
          Dismissible(
            key: Key("unique_key"), // Replace with your unique key logic
            background: Container(
              color: myColorRed,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 32,
              ),
              alignment: Alignment.centerRight,
            
              padding: EdgeInsets.only(right: 20.0),
            ),
            onDismissed: (direction) {
              // Handle delete action here
              // You can call a function to delete the item from your data source
            },
            child: Obx(() =>   Container(
            width: double.infinity,
                margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              border: border,
              color: themeController.isLightMode.value ? myColorWhite : myColor,
              boxShadow: [themeController.isLightMode.value  ? boxshadow2 : boxdark ],
              borderRadius: boRadius5,
        
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  ImageComponent(myWidth: 50.0,myheight: 50.0,myImage: "assets/ball.png",),
                Text(
                  "WINNER11",
                  style: TextStyle(
                    color: myColorRed,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto1',
                  ),
                ),
        
                Container(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                      item["tittle"],
                        style: CustomStyles.header3TextStyle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                Text(
                       style: CustomStyles.smallTextStyle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        "${item["description"]}",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${DateTime.now().day.toString()}/${DateTime.now().hour.toString()}-${DateTime.now().minute.toString()}",
                            style: CustomStyles.verysmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
        
        });
        
        } else {
          return Text('No match data available');
        }
      } else {
        return Text('No data available');
      }
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return summer2; // Replace with your shimmer widget
    } else {
      return Text('Data retrieval is not in progress');
    }
  },
);
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText(this.text);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isExpanded ? widget.text : widget.text.substring(0, 50) + '...',
          style: CustomStyles.textExternelgray,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 3,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: isExpanded
              ? Icon(Icons.arrow_drop_down)
              : Icon(Icons.arrow_drop_up),
        ),
      ],
    );
  }
}




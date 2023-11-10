import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/darkmode.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/header/headerTop.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';

import '../header/appbar.dart';

class MyNoti extends StatefulWidget {
  const MyNoti({super.key});

  @override
  State<MyNoti> createState() => _MyNotiState();
}

class _MyNotiState extends State<MyNoti> {
      final ThemeController themeController = Get.put(ThemeController());
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
        title: 'Nitification',
      
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
                  child:  Column(
             
                    children: [

                      titlebtn(HeadName: "New", context1: context, Headno: 20, routes: "/"),
                         size20h,
                Container(
          
                
                child: NotificationItem(content: "My first nitification  we check to how it is look like", title: '', timestamp:DateTime.now() ,),
                
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

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title), // Unique key for the item
      background: Container(
        color: myColorRed, // Color for the delete action background
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
      child:        Container(
              width: double.infinity,
             decoration: BoxDecoration(  
                     border: border,
              borderRadius: boRadius5,
              ),
                padding: EdgeInsets.all(10),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
       
                  //  ImageComponent(myWidth: 50.0,myheight: 50.0,myImage: "assets/ball.png",),
                         Text(
                "MPL",
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
                        Text("My first nitification  we check to how it is look like  We check to see how it looks like. My first notification. We check to see how it looks like. We check to see how it looks like. My first notification. We check to see how it looks like.",style: CustomStyles.header3TextStyle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        ),
                            ExpandableText(
            "My first notification. We check to see how it looks like. My first notification. We check to see how it looks like. My first notification. We check to see how it looks like.",
          ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${DateTime.now().day.toString()}/${DateTime.now().hour.toString()}-${DateTime.now().minute.toString()}",style: CustomStyles.verysmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                           ),
                                  ],
                                )
                     ],),
                   )
      
               ],) ,
              )
   
          
           
      
      
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
          child:isExpanded ?Icon(Icons.arrow_drop_down): Icon(Icons.arrow_drop_up),
        ),
      ],
    );
  }
}
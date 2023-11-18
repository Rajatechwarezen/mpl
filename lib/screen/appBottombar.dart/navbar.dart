import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:flutter/material.dart';
import 'package:WINNER11/screen/component/imageComponet.dart';
import 'package:WINNER11/screen/home.dart';
import 'package:WINNER11/screen/wallet/wallet.dart';
import 'package:WINNER11/utilis/alinement.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:get/get.dart';

class NavBarMusicWidget extends StatefulWidget {
  const NavBarMusicWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavBarMusicWidgetState createState() => _NavBarMusicWidgetState();
}

class _NavBarMusicWidgetState extends State<NavBarMusicWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }
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
    return Obx(
  () =>Container(
        width: double.infinity,
        height: 60,
      decoration: BoxDecoration(
        color:  themeController.isLightMode.value ?  myColorWhite : myColor,
        boxShadow:  [  themeController.isLightMode.value ?  boxshadow2 : boxdark]),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed("/blog");
                  },
                  child:  TextButtonapp(text: "Bolg", icon:  themeController.isLightMode.value ?    'assets/icon/cricket.png':  'assets/icon/cricket-dark.png'),
               ),
               InkWell(
                  onTap: (){
                            Get.toNamed('/myContestStatus');
                  },
               child: TextButtonapp(text: "Matchs", icon:  themeController.isLightMode.value ?    'assets/icon/play.png': 'assets/icon/play-dark.png' ),
               ),

                  InkWell(
                  onTap: (){
                            Get.toNamed('/live');
                  },
               child: TextButtonapp(text: "Live", icon:  themeController.isLightMode.value ?   'assets/icon/live2.png'  :'assets/icon/live.png'  ),
                  ) ,   
               TextButtonapp(text: "Wallet", icon: themeController.isLightMode.value ?     'assets/icon/wallet.png' : 'assets/icon/wallet-dark.png')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
TextButtonapp({text, icon}) {
  return Column(
    crossAxisAlignment: AlignmentCenterCross,
    mainAxisAlignment: AlignmentCenterMain,
    children: [
      ImageComponent(myWidth: 30.0, myheight: 30.0, myImage: icon),

      const SizedBox(
          width: 8), // Adjust the spacing between icon and label as needed
      Text(
        text.toString(),
        style: CustomStyles.textExternel,
      ),
    ],
  );
}

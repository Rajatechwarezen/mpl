import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mplpro/screen/component/darkmode.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/wallet/wallet.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilis/AllColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   final ThemeController themeController = Get.put(ThemeController());
  final String title;
  final List<Widget> actions;

  CustomAppBar({
    required this.title,
    this.actions = const [],
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,

          title: Row(
            children: [
              size10w,
              InkWell(
                onTap: () async {
                  final store = await SharedPreferences.getInstance();
            var id = store.getString('userId');
                  Get.toNamed("/home",arguments: id);
                },
                child: DefaultTextStyle(
                    style: TextStyle(
                      color: myColorRed,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto1',
                    ),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  
                  ),
                ),
              ),
            ],
          ),
          foregroundColor: themeController.isLightMode.value ? myColor: myColorWhite,
          actions: [
            ImageComponent(
              myWidth: 50.0,
              myheight: 50.0,
              myImage:themeController.isLightMode.value ? "assets/icon/lang.png" : "assets/icon/lang2.png",
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                    showDragHandle: true,
                    useSafeArea: true,
                    isScrollControlled: true,
                    elevation: 8,
                    context: context,
                    builder: (BuildContext context) {
                      return MyWallet();
                    });
              },
              child: ImageComponent(
                myWidth: 50.0,
                myheight: 50.0,
                myImage:themeController.isLightMode.value? "assets/icon/wallet.png":"assets/icon/wallet2.png",
              ),
            ),
            IconButton(
              icon: themeController.isLightMode.value ? Icon(Icons.sunny_snowing):  Icon(Icons.sunny_snowing,color: myColorWhite,), // Icon to display
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
            IconButton(
              icon: themeController.isLightMode.value ?Icon(Icons.notifications_none_outlined):Icon(  Icons.notifications_none, color: myColorWhite,), // Icon to display
              onPressed: () {
                Get.toNamed('/myNoti');
              },
            )
          ],
        ),
      ),
    );
  }
}

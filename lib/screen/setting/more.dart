import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/header/headerTop.dart';

import 'package:mplpro/utilis/fontstyle.dart';

import '../header/sidebar.dart';
import '../../utilis/globlemargin.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'More',
      ),
      body: Container(
        margin: GlobleglobleMargin.globleMargin,
        child: Column(children: [
          Column(
            children: [
              Simpletitlebtn(
                HeadName: "Documentation",
              ),
              
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                Text('Tream & Condition Policy', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                    Get.toNamed('/tarmAnd');
                  
                },
              ),     
          
                    ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('About Us', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                  Get.toNamed('/myAboutus');
                  
                },
              ),
          
                 ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: const Icon(
                    Icons.info), // Change the icon to a different policy icon
                title: Row(
                  children: [
                    Text('fql', style: CustomStyles.header2TextStyle),
                 
                  ],
                ),
                onTap: () {
                  Get.toNamed('/fql');
                  
                },
              ),
        ],
          )
        ]),
      ),
    );
  }

}
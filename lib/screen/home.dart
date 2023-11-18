import 'dart:async';

import 'package:WINNER11/screen/appBottombar.dart/navbar.dart';
import 'package:WINNER11/screen/tap3/dome.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/Db/insertData.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';

import 'package:WINNER11/screen/component/tabar.dart';

import 'package:WINNER11/screen/header/appbar.dart';

import 'package:WINNER11/screen/header/sidebar.dart';
import 'package:WINNER11/screen/live/live.dart';
import 'package:WINNER11/screen/tap/topIndigetor.dart';
import 'package:WINNER11/screen/tap1/upcomming.dart';

import 'package:WINNER11/screen/tap3/blogList.dart';
import 'package:WINNER11/service/authapi.dart';

import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/alinement.dart';

import 'package:WINNER11/utilis/globlemargin.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
 late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  final String? id = Get.arguments as String?;
  
  late TabController _tabController;
  @override
  void initState() {
  
    super.initState();
getConnectivity();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }
 getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            // ignore: use_build_context_synchronously
            showDialogBox(context,isAlertSet,setState,isDeviceConnected);
            setState(() => isAlertSet = true);
          }
        },
      );
    

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'WINNER11',
      ),
      drawer: myDrawer(context, id),
      body: Column(
        children: [
          //Indigator
          Indigator(currentPage: 0),
          Container(
            height: 600,
            margin: GlobleglobleMargin.globleMargin,
            child:   RefreshIndicator(
                       onRefresh: () async {
                         },
                       child: const UpComming(),
                     ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBarMusicWidget(),
    );
  }
}

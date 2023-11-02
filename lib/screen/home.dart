import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';

import 'package:mplpro/screen/component/tabar.dart';

import 'package:mplpro/screen/header/appbar.dart';

import 'package:mplpro/screen/header/sidebar.dart';
import 'package:mplpro/screen/tap/topIndigetor.dart';
import 'package:mplpro/screen/tap1/upcomming.dart';

import 'package:mplpro/screen/tap3/blogList.dart';

import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/alinement.dart';

import 'package:mplpro/utilis/globlemargin.dart';

import 'component/darkmode.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final String? id = Get.arguments as String?;

  late TabController _tabController;
  @override
  void initState() {
    initDatabase();
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MPL',
      ),
      drawer: myDrawer(context, id),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Indigator
            Indigator(currentPage: 0),
            Container(
              margin: GlobleglobleMargin.globleMargin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: AlignmentStartCross,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.zero,
                      child: TabBar(
                        tabAlignment: TabAlignment.center,
                        labelPadding: const EdgeInsets.all(5),
                        controller: _tabController,
                        indicatorColor: myColorRed,
                        isScrollable: true,
                        tabs: [
                          MyTab("Cricket"),
                          MyTab("Blog"),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 850,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        RefreshIndicator(
                          onRefresh: () async {},
                          child: Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 20),
                            child: const UpComming(),
                          ),
                        ),
                        //blog
                        RefreshIndicator(
                          onRefresh: () async {},
                          child: Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 20),
                            child: BlogList(blogs: blogList),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const NavBarMusicWidget(),
    );
  }
}

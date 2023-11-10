import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/Db/insertData.dart';
import 'package:mplpro/screen/component/darkmode.dart';
import 'package:mplpro/screen/component/tabar.dart';
import 'package:mplpro/screen/tap/topIndigetor.dart';

import 'package:mplpro/screen/tap2/mycontest.dart';
import 'package:mplpro/service/authapi.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/alinement.dart';
import 'package:mplpro/utilis/globlemargin.dart';

import '../header/appbar.dart';

class MyCricketContestStatus extends StatefulWidget {
  const MyCricketContestStatus({super.key});

  @override
  State<MyCricketContestStatus> createState() => _MyCricketContestStatusState();
}

class _MyCricketContestStatusState extends State<MyCricketContestStatus> with TickerProviderStateMixin {
   final ThemeController themeController = Get.put(ThemeController());
ApiService apiservice = ApiService();

  late TabController _tabController;
  @override
  void initState() {
      initDatabase();
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MyContest',
      ),
   
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
                          MyTab("Upcomming"),
                            MyTab("Live"),
                              MyTab("Result")
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
               
                  SizedBox(
                    height: 1000,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
     ///upcomming
               FutureBuilder(
            future: apiservice.userAllDoc(data: {}, uri: "/user_upcoming_matches"),
            builder: (context, snapshot) {
         
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the future is still running, display a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If an error occurred, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been successfully fetched
                 final data =(snapshot.data as Map<String, dynamic>)["data"]["result"];
    
               if(data !=  [] && data != null   ){
                 return Mycontest(data: data, type: "upcomming",);
               }else{
                return Text("");
               }
              }
            },
          ),



                 FutureBuilder(
            future:  apiservice.userAllDoc(data: {}, uri: "/user_live_matches"),
            builder: (context, snapshot) {
         
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the future is still running, display a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If an error occurred, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been successfully fetched
                   final data =(snapshot.data as Map<String, dynamic>)["data"]["result"];
    

               if(data !=  [] && data != null   ){
                 return Mycontest(data: data, type: "live",);
               }else{
                return Text("");
               }
              }
            },
          ),

                 
                        FutureBuilder(
            future:apiservice.userAllDoc(data: {}, uri: "/user_result_matches"),
            builder: (context, snapshot) {
         
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the future is still running, display a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If an error occurred, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been successfully fetched
                     final data =(snapshot.data as Map<String, dynamic>)["data"]["result"];
    

               if(data !=  [] && data != null   ){
                 return Mycontest(data: data, type: "finsh",);
               }else{
                return Text("");
               }
              }
            },
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
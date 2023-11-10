import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/KYC/kyc.dart';
import 'package:mplpro/screen/aboutTerm&Condition/Tream&con.dart';
import 'package:mplpro/screen/aboutTerm&Condition/aboutus.dart';
import 'package:mplpro/screen/aboutTerm&Condition/faq.dart';
import 'package:mplpro/screen/auth/login.dart';
import 'package:mplpro/screen/auth/otpsrceen.dart';
import 'package:mplpro/screen/home.dart';
import 'package:mplpro/screen/notification/enableNotification.dart';
import 'package:mplpro/screen/notification/noti.dart';
import 'package:mplpro/screen/profile/editProfile.dart';
import 'package:mplpro/screen/profile/profile.dart';
import 'package:mplpro/screen/setting/Setting.dart';
import 'package:mplpro/screen/setting/more.dart';
import 'package:mplpro/screen/tap2/AllShowContest.dart';
import 'package:mplpro/screen/tap2/ContList.dart';
import 'package:mplpro/screen/tap2/CreatCont.dart';
import 'package:mplpro/screen/tap2/MyContDetail.dart';
import 'package:mplpro/screen/tap2/mycontestStatus.dart';
import 'package:mplpro/screen/wallet/AllHestory.dart';
import 'package:mplpro/screen/wallet/wallet.dart';
import 'package:mplpro/screen/wallet/withdraw.dart';
import 'package:mplpro/splash/intro.dart';
import 'package:mplpro/splash/splash.dart';

import '../screen/wallet/addmoney.dart';

var allRutes = [
  GetPage(name: '/splash', page: () => SplashScreen()),
  GetPage(name: '/intro', page: () => OnboardingScreen()),
  GetPage(name: '/home', page: () => MyHomePage()),
  GetPage(name: '/login', page: () => Loginpage()),
  GetPage(name: '/otp', page: () => OtpPage()),
  GetPage(name: '/contList', page: () => ContList()),
  GetPage(name: '/myCont', page: () => MyCont()),
  GetPage(name: '/myNoti', page: () => MyNoti()),
  GetPage(name: '/wallet', page: () => MyWallet()),
  GetPage(
      name: '/addMoney',
      page: () => Addmoney(
            drtotalmoney: 200,
          )),
  GetPage(name: "/setting", page: () => MySetting()),
  GetPage(name: "/kyc", page: () => KYC()),

  GetPage(name: "/createCont", page: () => CreateCont()),

  GetPage(name: "/showProfile", page: () => ShowProfile()),

  GetPage(name: "/editProfile", page: () => EditProfile()),
  GetPage(name: "/myAboutus", page: () => Myaboutus()),
  //terms and condition
  GetPage(name: "/fql", page: () => Steps()),
  GetPage(name: "/tarmAnd", page: () => TarmAnd()),
  GetPage(name: "/mySeeMore", page: () => SeeMore()),
  GetPage(name: "/notification", page: () => MyNotificationEnable()),
  GetPage(name: "/myContestStatus", page: () => MyCricketContestStatus()),
  GetPage(name: "/withdraw", page: () => WithdrawPage()),
    GetPage(name: "/hestoryWallet", page: () => AllHestory()),

        GetPage(name: "/AllShowContest", page: () => AllShowContest())

];

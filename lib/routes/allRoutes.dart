import 'package:WINNER11/screen/live/live.dart';
import 'package:WINNER11/screen/tap3/myFullBlog.dart';

import 'package:get/get.dart';
import 'package:WINNER11/screen/KYC/kyc.dart';
import 'package:WINNER11/screen/aboutTerm&Condition/Tream&con.dart';
import 'package:WINNER11/screen/aboutTerm&Condition/aboutus.dart';
import 'package:WINNER11/screen/aboutTerm&Condition/faq.dart';
import 'package:WINNER11/screen/auth/login.dart';
import 'package:WINNER11/screen/auth/otpsrceen.dart';
import 'package:WINNER11/screen/home.dart';
import 'package:WINNER11/screen/notification/enableNotification.dart';
import 'package:WINNER11/screen/notification/noti.dart';
import 'package:WINNER11/screen/profile/editProfile.dart';
import 'package:WINNER11/screen/profile/profile.dart';
import 'package:WINNER11/screen/setting/Setting.dart';
import 'package:WINNER11/screen/setting/more.dart';
import 'package:WINNER11/screen/tap2/AllShowContest.dart';
import 'package:WINNER11/screen/tap2/ContList.dart';
import 'package:WINNER11/screen/tap2/CreatCont.dart';
import 'package:WINNER11/screen/tap2/MyContDetail.dart';
import 'package:WINNER11/screen/tap2/mycontestStatus.dart';
import 'package:WINNER11/screen/wallet/AllHestory.dart';
import 'package:WINNER11/screen/wallet/wallet.dart';
import 'package:WINNER11/screen/wallet/withdraw.dart';
import 'package:WINNER11/splash/intro.dart';
import 'package:WINNER11/splash/splash.dart';

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
  GetPage(name: "/faq", page: () => Steps()),
  GetPage(name: "/tarmAnd", page: () => TarmAnd()),
  GetPage(name: "/mySeeMore", page: () => SeeMore()),
  GetPage(name: "/notification", page: () => MyNotificationEnable()),
  GetPage(name: "/myContestStatus", page: () => MyCricketContestStatus()),
  GetPage(name: "/withdraw", page: () => WithdrawPage()),
  GetPage(name: "/historyWallet", page: () => AllHestory()),

  GetPage(name: "/AllShowContest", page: () => AllShowContest()),
  GetPage(name: "/blog", page: () => MyFullBlog()),
    GetPage(name: "/live", page: () => LiveScores())
];

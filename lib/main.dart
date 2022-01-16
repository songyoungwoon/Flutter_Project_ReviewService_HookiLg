import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/login/login_page.dart';
import 'package:fp_review_service_hookilg/page/reviewList_page.dart';
import 'package:fp_review_service_hookilg/page/writeReviewTest_page.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';
import 'package:fp_review_service_hookilg/screen/my_page_test.dart';

import 'widget/bottom_bar.dart';
import 'screen/home.dart';
import 'screen/search.dart';
import 'screen/my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HookiLg',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black12,
      ),
      home:
      //reviewList.reviewListInfo('기생충', '봉준호'),
      //writeReviewTest('기생충', '봉준호'),
      //WelcomeScreen(),
      Login(),
      //myPageTest(),
    );
  }
}

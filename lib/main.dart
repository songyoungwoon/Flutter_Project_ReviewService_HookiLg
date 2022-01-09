import 'package:flutter/material.dart';
import 'widget/bottom_bar.dart';
import 'screen/home.dart';
import 'screen/search.dart';
import 'screen/my_page.dart';

void main() {
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
      title: 'HookiLg',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Home(),
              Search(),
              Container(
                child: Center(
                  child: Text('favorites'),
                ),
              ),
              MyPage(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}

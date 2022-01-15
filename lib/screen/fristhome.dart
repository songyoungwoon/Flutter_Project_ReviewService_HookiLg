//library
import 'package:flutter/material.dart';

//local path
import '../widget/bottom_bar.dart';
import 'home.dart';
import 'search.dart';
import 'favorites.dart';
import 'my_page.dart';
import 'my_page_test.dart';


class FirstHome extends StatefulWidget {
  _FirstHome createState() => _FirstHome();
}

class _FirstHome extends State<FirstHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Home(),
            Search(),
            favoriteLsit(),
            myPageTest(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

}

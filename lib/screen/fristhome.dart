import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/screen/search.dart';
import 'package:fp_review_service_hookilg/widget/bottom_bar.dart';

import 'home.dart';
import 'my_page.dart';


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
    );
  }

}

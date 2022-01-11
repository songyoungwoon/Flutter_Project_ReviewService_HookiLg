import 'package:flutter/material.dart';
import '../page/showReview_page.dart';
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.black26,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              child:Text('Home'),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 18,
              ),
              child:Text('Search'),
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
                size: 18,
              ),
              child:Text('Favorites'),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                size: 18,
              ),
              child:Text('MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}

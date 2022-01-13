import 'package:flutter/material.dart';
import '../page/showReview_page.dart';
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      // color: Colors.white,
      child: TabBar(
        labelColor: Colors.amberAccent[700],
        unselectedLabelColor: Colors.pink[300],
        indicatorColor: Colors.transparent,
        labelStyle: TextStyle(fontFamily: 'EliceDigitalBaeum',fontWeight: FontWeight.bold),
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              size: 16,
            ),
            child:Text('Home'),
          ),
          Tab(
            icon: Icon(
              Icons.search,
              size: 16,
            ),
            child:Text('Search'),
          ),
          Tab(
            icon: Icon(
              Icons.favorite,
              size: 16,
            ),
            child:Text('Favorites',style: TextStyle(fontSize: 13),),
          ),
          Tab(
            icon: Icon(
              Icons.account_circle,
              size: 16,
            ),
            child:Text('My Page'),
          ),
        ],
      ),
    );
  }
}

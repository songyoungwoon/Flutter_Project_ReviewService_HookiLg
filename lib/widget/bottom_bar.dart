//library
import 'package:flutter/material.dart';

//local path

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.transparent,
        labelStyle: TextStyle(fontFamily: 'EliceDigitalBaeum',fontWeight: FontWeight.bold),
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              size: 16,
            ),
            child:Text('Home', style: TextStyle(fontSize: 10),),
          ),
          Tab(
            icon: Icon(
              Icons.search,
              size: 16,
            ),
            child:Text('Search', style: TextStyle(fontSize: 10),),
          ),
          Tab(
            icon: Icon(
              Icons.favorite,
              size: 16,
            ),
            child:Text('Favorites',style: TextStyle(fontSize: 10),),
          ),
          Tab(
            icon: Icon(
              Icons.account_circle,
              size: 16,
            ),
            child:Text('My Page', style: TextStyle(fontSize: 10),),
          ),
        ],
      ),
    );
  }
}

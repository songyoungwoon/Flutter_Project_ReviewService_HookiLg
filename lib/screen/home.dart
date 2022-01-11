import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';

import '../widget/search_bar.dart';
import '../page/reviewList_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => reviewList()),
              );
            },
            icon: Icon(
              Icons.auto_stories,
              size: 40,
            ),
            color: Colors.pink[200],
          ),
          searchBar(),
          Padding(padding: EdgeInsets.only(top: 20),),
          CarouselSlider(
            options: CarouselOptions(height: 220.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'image $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Icon(Icons.person,color: Colors.amber[600],),
                    Text(' 이달의 베스트 리뷰어', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                  ],
                ),
                Container(
                  color: Colors.pink[200],
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(10),
                    itemCount: 10,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        child:Container(
                          padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('images/profile.jpg', ),
                              ),
                            ),
                            Text((index+1).toString() + '위'),
                          ],
                        ),
                      ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Icon(Icons.article,color: Colors.amber[600],),
                    Text(' 이달의 베스트 리뷰', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                CarouselSlider(
                  options: CarouselOptions(height: 220.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Text(
                              'image $i',
                              style: TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

        ]),
      ),

    );
  }
}

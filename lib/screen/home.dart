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
            color: Color(0xFFFF80AB),
          ),
          searchBar(),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                height: 220.0),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.blueGrey[50]),
                      child: Text(
                        'image $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          Padding(padding: EdgeInsets.only(top: 13)),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.amber[500],
                    ),
                    Text(
                      ' 이달의 베스트 리뷰어',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'EliceDigitalBaeum'
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  color: Colors.indigo[100],
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(10),
                    itemCount: 10,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    'images/profile.jpg',
                                  ),
                                ),
                              ),
                              SizedBox(height: 9,),
                              Text((index + 1).toString() + '위',style: TextStyle(fontFamily: 'EliceDigitalBaeum',),),
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
          Padding(padding: EdgeInsets.only(bottom:13)),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.article,
                      color: Colors.amber[500],
                    ),
                    Text(
                      ' 이달의 베스트 리뷰',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'EliceDigitalBaeum'
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: 220.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.pink[50]),
                            child: Text(
                              'image $i',
                              style: TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                ),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

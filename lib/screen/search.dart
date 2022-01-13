import 'package:flutter/material.dart';

import '../widget/search_bar.dart';
import '../page/searchResult_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // var returnData;
  String searchData='';
  // List allData;

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text('data')),
                  Padding(padding: EdgeInsets.all(12)),
                  searchBar(),
                  Container(padding:EdgeInsets.only(left: 15),
                  child:
                  Row(
                    children: [
                      SizedBox(height: 40,),
                      Icon(Icons.star, color: Colors.amber,),
                      SizedBox(width: 5),
                      Text('인기 검색어', style: TextStyle(
                        fontWeight: FontWeight.bold, color:Colors.indigo[300],
                        fontFamily: 'EliceDigitalBaeum',
                        fontSize: 17
                      )),
                    ],
                  )),
                  ListTile(leading: Text('1', style: TextStyle(color: Colors.pink[300], 

                  fontWeight: FontWeight.bold,fontSize: 22,
                  fontFamily: 'NanumBarun'))
                  , title:Text('특송',style: TextStyle(fontWeight: FontWeight.bold,
                  fontFamily: 'EliceDigitalBaeum'))
                  ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('특송')),
                      );
                    },),

                  

                  ListTile(leading: Text('2', style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 

                  title:Text('하우스 오브 구찌',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('하우스 오브 구찌')),
                      );
                    },),


                  ListTile(leading: Text('3',style: TextStyle(color: Colors.amber[600],
                  fontFamily: 'NanumBarun', 
                  fontWeight: FontWeight.bold,fontSize: 20) ), 


                  title:Text('스타워즈',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('스타워즈')),
                      );
                    },),


                  ListTile(leading: Text('4',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 

                  title:Text('경관의 피',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('경관의 피')),
                      );
                    },),

                  ListTile(leading: Text('5',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 

                  title:Text('스파이더맨: 노 웨이 홈',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('스파이더맨: 노 웨이 홈')),
                      );
                    },),

                  
                  ListTile(leading: Text('6',style: TextStyle(color: Colors.amber[600],
                  fontFamily: 'NanumBarun', 
                  fontWeight: FontWeight.bold,fontSize: 20)), 


                  title:Text('해리포터',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('해리포터')),
                      );
                    },),

                  
                  ListTile(leading: Text('7',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 


                  title:Text('라푼젤',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('라푼젤')),
                      );
                    },),

                  
                  ListTile(leading: Text('8',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 


                  title:Text('티탄',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('티탄')),
                      );
                    },),

                  
                  ListTile(leading: Text('9',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 


                  title:Text('위대한 쇼맨',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('위대한 쇼맨')),
                      );
                    },),

                  
                  ListTile(leading: Text('10',style: TextStyle(color: Colors.amber[600], 
                  fontFamily: 'NanumBarun',
                  fontWeight: FontWeight.bold,fontSize: 20)), 


                  title:Text('씽2게더',style: TextStyle(fontFamily: 'EliceDigitalBaeum'))
                    ,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => searchResult('씽2게더')),
                      );
                    },),

                ],
              ),
            )
          ],
        ),
      ),
    );

  
}
}
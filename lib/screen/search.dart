import 'package:flutter/material.dart';
import '../widget/search_bar.dart';

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
                      Icon(Icons.star, color: Colors.amber,),
                      SizedBox(width: 5),
                      Text('인기 검색어', style: TextStyle(
                        fontWeight: FontWeight.bold, color:Colors.pink[300]
                      )),
                    ],
                  )),
                  ListTile(leading: Text('1', style: TextStyle(color: Colors.pink[300], 
                  fontWeight: FontWeight.bold,fontSize: 20))
                  , title:Text('김혜진',style: TextStyle(fontWeight: FontWeight.bold))),
                  

                  ListTile(leading: Text('2', style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('이나현')),

                  ListTile(leading: Text('3',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20) ), 
                  title:Text('김유진 군면제')),

                  ListTile(leading: Text('4',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('21세 정모양 인성논란')),

                  ListTile(leading: Text('5',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('정민경 새내기 강제탈출')),
                  
                  ListTile(leading: Text('6',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('송모씨 내맘대로 할거야 말리지 마')),
                  
                  ListTile(leading: Text('7',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('까까까까까만 선글라스')),
                  
                  ListTile(leading: Text('8',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('스노우볼 인성논란')),
                  
                  ListTile(leading: Text('9',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('2학 밥 맛있는 거좀')),
                  
                  ListTile(leading: Text('10',style: TextStyle(color: Colors.amber[600], 
                  fontWeight: FontWeight.bold,fontSize: 20)), 
                  title:Text('예미나녜! 화냤녜!')),
                ],
              ),
            )
          ],
        ),
      ),
    );

  
}
}
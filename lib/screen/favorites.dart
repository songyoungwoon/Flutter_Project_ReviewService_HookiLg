// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class favoriteLsit extends StatefulWidget {
  

  favoriteLsit();
  favoriteLsit.reviewListInfo();

  @override
  _favoriteLsitState createState() => _favoriteLsitState();
}

List<String> titles =<String>[
  'When will my life begin',
  'Loving you girl',
  'Happy Ending',
  'Like 1999',
  'CAN\'T STOP THE FEELING',
  'ex I never hed',
  'Play with Fire',
  'Viva La Vida'
];

bool isFavorite =true;

class _favoriteLsitState extends State<favoriteLsit> {
  _favoriteLsitState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('My Favorite',
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'EliceDigitalBaeum'
          ),
        ),
        leading: Icon(Icons.favorite, color: Colors.pink[300],),

      ),
      body: Container(
        color: Colors.white,
        child:ListView.builder(
        // padding: EdgeInsets.all(8),
        itemCount: titles.length,
        itemBuilder: (BuildContext context,int index){
          return Card(
            shadowColor: Colors.pink[100],
            elevation: 8,
            margin:EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: ListTile(
              leading: ClipRect(
                child: Container(
                  
                  width: 55,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff06292),
                        Colors.amber
                      ]
                    )
                  ),
                ),
              ),
              title: Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${titles[index]}', 
                    style:TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: 'NanumBarun') ,)
                  ]
                )
              ),
              trailing: IconButton(
                onPressed: (){
                  if(isFavorite==true){
                    
                  }
                },
                icon: Icon(Icons.favorite, color: Colors.pink[200],),),
            ),
          );
          
        },
      ),
      ),
    );
  }
}

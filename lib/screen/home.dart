import 'package:flutter/material.dart';
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
      body:Center(
        child: IconButton(
          onPressed: (){
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewList()),
                );
          },
          icon: Icon(Icons.auto_stories,
          size: 40,),  
          color: Colors.grey[600],
        ),
        
        
      ) 
      

    );
  }
}

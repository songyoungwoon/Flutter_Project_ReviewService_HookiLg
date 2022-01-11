// import '../page/writeReview_page.dart';
import 'package:flutter/material.dart';
// import '../main.dart';
import '../page/reviewList_page.dart';
// import '../screen/home.dart';
import '../screen/fristhome.dart';
import '../widget/writeText.dart';


class showReview extends StatefulWidget {
  String review_title ='';
  String review_contents ='';

  showReview(this.review_title,this.review_contents);

  @override
  _showReviewState createState() => _showReviewState(review_title, review_contents);
}


String replyString='';

class _showReviewState extends State<showReview>{
  String _review_title='';
  String _review_contents='';

  List <String>dropdownList=['modify','delete'];
  String selectedValue ='modify';

  _showReviewState(this._review_title,this._review_contents);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
          title: Text("Review",style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
            color: Colors.pinkAccent,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.pinkAccent,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstHome()),
                  );
                },
              ),
            ),
          ],
       backgroundColor: Colors.white,
       foregroundColor: Colors.black54,
       shadowColor: Colors.white24,
        ),
     body:
     SingleChildScrollView(

     child: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:30, horizontal: 30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              Icon(Icons.turned_in_not_sharp, color: Colors.pinkAccent,),
              SizedBox(width: 5),
              Text(_review_title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )),
              Expanded(child: SizedBox(height: 10),),

              IconButton(onPressed: (){

              }, icon: Icon(Icons.upgrade,color: Colors.pinkAccent,)),
              IconButton(onPressed: (){

              }, icon: Icon(Icons.delete,color: Colors.pinkAccent,))


            ]),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(_review_contents),)
                ),
            ]),

            SizedBox(height: 5),
            Divider(color: Colors.pink,thickness: 2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              SizedBox(width:5),
              Icon(Icons.question_answer, color: Colors.pink[300],),
              Expanded(child: SizedBox(height: 7)),
              ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                        primary: Colors.pink[200]
                      ),
                onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reviewList()),
                  );
              }, icon: Icon(Icons.list,
              ),
               label: Text('목록',
               style: TextStyle(fontSize: 14))
               ),
              SizedBox(width:5),

            ],
            ),
            SizedBox(height: 5),
            
            wirteText(2,60,'writeReply')
            

          ]),
        )
    )
   )
   );
  }
}
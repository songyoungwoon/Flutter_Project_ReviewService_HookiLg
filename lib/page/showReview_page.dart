import '../page/writeReview_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../page/reviewList_page.dart';

class showReview extends StatefulWidget {
  String review_title ='';
  String review_contents ='';

  showReview(this.review_title,this.review_contents);

  @override
  _showReviewState createState() => _showReviewState(review_title, review_contents);
}

class _showReviewState extends State<showReview>{
  String _review_title='';
  String _review_contents='';

  _showReviewState(this._review_title,this._review_contents);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
          title: Text("나의 후기"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
          ],
          backgroundColor: Colors.black12,
        ),
     body:Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:30, horizontal: 45),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              // Text('title',
              // style: TextStyle(
              //   fontSize: 12,
              // )),
              Icon(Icons.turned_in_not_sharp),
              SizedBox(width: 5),
              Text(_review_title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ))
            ]),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 350,
                  height: 420,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2)
                    ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(_review_contents),)
                )

            ]),
            SizedBox(height: 5),
            Row(children: [
              Expanded(child: SizedBox(height: 5)),
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
               style: TextStyle(fontSize: 15))
               )
            ],)
          ]),
        )
    ) 
   );
  }

  

}
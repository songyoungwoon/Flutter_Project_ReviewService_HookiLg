import '../page/writeReview_page.dart';
import 'package:flutter/material.dart';

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
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60,horizontal: 40),
        child: Column(
          children: [
            Text(_review_title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 15,),
            Container(
              
              child: Text(_review_contents),
              
            )
        ]),
        )
    );
  }

}
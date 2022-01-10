import 'package:flutter/material.dart';
import 'dart:convert';
import '../main.dart';
import '../widget/writeText.dart';
import '../page/showReview_page.dart';


class writeReview extends StatefulWidget {
  writeReview({Key? key}) : super(key: key);
  @override
  _writeReviewState createState() => _writeReviewState();
}

String title_text ='';
String content_text='' ;

class _writeReviewState extends State<writeReview>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 60),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection(),
                    SizedBox(height: 15),
                    Text("내용",
                    style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 10),
                    wirteText(40,300),
                  ],
                )
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Expanded(child: SizedBox(height: 20)),
                    ElevatedButton.icon(
                      onPressed: (){
                      // BuildContext context;
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => showReview(title_text,'content')),
                        );
                      },
                      icon: Icon(Icons.add,size:15),
                      label: Text("저장",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[200]
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}
// 제목 입력칸
final TextEditingController _titleEditingController = TextEditingController();

Widget titleSection(){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("제목",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Colors.pinkAccent
          ),
        ),

        TextField(
          style: TextStyle(
            fontSize: 18,
            ),
          decoration: InputDecoration(
            hintText: 'Title',
          ),
          onChanged: (value){
            title_text=value;
          },
        )
      ],
    ),
  );

}


// Widget saveBtSection(){
//   return Container(
//     child: Row(
//       children: [
//         Expanded(child: SizedBox(height: 20)),
//         ElevatedButton.icon(
//           onPressed: (){
//             // BuildContext context;
//             Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => writeReview()),
//                 );
//           },
//           icon: Icon(Icons.add,size:15),
//           label: Text("저장",
//           style: TextStyle(fontWeight: FontWeight.bold),),
//           style: ElevatedButton.styleFrom(
//             primary: Colors.pink[200]
//           ),
//         )
//       ]
//     ),
//   );

// }
// // 저장버튼 => SRV 페이지 이동
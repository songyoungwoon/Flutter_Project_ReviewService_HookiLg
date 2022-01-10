import 'package:flutter/material.dart';
import 'dart:convert';
import '../main.dart';
import '../widget/writeText.dart';
import '../page/showReview_page.dart';


class writeReviewTest extends StatefulWidget {
  writeReviewTest({Key? key}) : super(key: key);
  @override
  _writeReviewTestState createState() => _writeReviewTestState();
}

class _writeReviewTestState extends State<writeReviewTest>{
  // 제목 입력칸
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController = TextEditingController();
  String title = '';
  String content ='';

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
              title = value;
            },
          )
        ],
      ),
    );
  }

  Widget TextSection() {
    return Container(
      height: 500,
      child: TextField(
          controller: _contentEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0)
              )
          ),
          // maxLines: 40,
          onChanged: (value) {
            setState(() {
              content = value;
            });
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        TextSection(),
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
                           /* // BuildContext context;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => showReview()),
                            );
                            */
                          },
                          icon: Icon(Icons.add,size:15),
                          label: Text("저장",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[200]
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
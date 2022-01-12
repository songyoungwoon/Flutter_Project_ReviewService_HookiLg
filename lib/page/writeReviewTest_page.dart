import 'package:flutter/material.dart';

import 'package:flutter_quill/flutter_quill.dart' as fq;

class writeReviewTest extends StatefulWidget {
  const writeReviewTest({Key? key}) : super(key: key);

  @override
  _writeReviewTestState createState() => _writeReviewTestState();
}

class _writeReviewTestState extends State<writeReviewTest> {
  fq.QuillController _controller = fq.QuillController.basic();
  String title_text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Review",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFFF06292)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_album,color: Colors.pink[200],),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.save, color: Colors.pink[200],),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10,0,10,0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10,0,10,0),child:Text('제목', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: '제목을 입력하세요.',
                        ),
                        onChanged: (value){
                          title_text=value;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            fq.QuillToolbar.basic(controller: _controller),
            Expanded(
              child: Container(
                child: fq.QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

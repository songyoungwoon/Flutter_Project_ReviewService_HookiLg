import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../page/searchResult_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final TextEditingController _filter = TextEditingController();

  FocusNode focusNode = FocusNode();
  bool isFocusNodeTrue = false;
  String _searchText = "";
  bool isFocusOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
      height: 72,
      width: 500,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchResult(value)),
                );
              },

              focusNode: focusNode,
              style: TextStyle(
                fontSize: 12,
              ),
              autofocus: false,
              controller: _filter,
              decoration: InputDecoration(
                filled: true, 
                fillColor: Colors.blueAccent[99],
                prefixIcon:
                focusNode.hasFocus
                    ? TextButton(
                  child:Text('취소'),
                  onPressed: () {
                    setState(() {
                      _filter.clear();
                      _searchText = "";
                      focusNode.unfocus();
                    });
                  },)
                    : Icon(Icons.search, color: Colors.pink[300], size: 20),

                suffixIcon: focusNode.hasFocus
                    ? IconButton(
                        icon:
                            Icon(Icons.cancel, color: Colors.black26, size: 20),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                          });
                        },
                      )
                    : Text(''),
                hintText: '리뷰나 해석을 보고싶은 영화를 검색하세요.',
                //hintStyle: FontWeight.bold,
                labelStyle: TextStyle(color: Colors.black12,),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );

   
  }


}

// void createOrUpdate( String _searchData) {
//   final usercol = FirebaseFirestore.instance.collection("searchData");
//   usercol.set({
//     "count": "$_searchData",
//   });
// }


// void updatedata(String code, String status) {
//   final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
//   usercol.update({
//     "status": "$status",
//   });
// }

// void deleteData() {
//   final usercol = FirebaseFirestore.instance.collection("review").doc();
//   usercol.delete();
// }

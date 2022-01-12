import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    body: StreamBuilder(
      stream: FirebaseFirestore.instance
      .collection('searchData')
      .where("data",isEqualTo: searchData)
      .snapshots(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("loading"));
        }

        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (ctx,index){
            
            return Container(
              child: Text(snapshot.data.docs[index]['data'])
            );
          } 
          );
    
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(child: Text('data')),
    //               Padding(padding: EdgeInsets.all(12)),
    //               searchBar(),
    //               Container(padding:EdgeInsets.only(left: 15),child:Text('인기 검색어')),
    //               ListTile(leading: Text('1'), title:Text('parasite')),
    //               ListTile(leading: Text('2'), title:Text('starwars')),
    //               ListTile(leading: Text('3'), title:Text('아')),
    //               ListTile(leading: Text('4'), title:Text('왜')),
    //               ListTile(leading: Text('5'), title:Text('안')),
    //               ListTile(leading: Text('6'), title:Text('되')),
    //               ListTile(leading: Text('7'), title:Text('는')),
    //               ListTile(leading: Text('8'), title:Text('거')),
    //               ListTile(leading: Text('9'), title:Text('지')),
    //               ListTile(leading: Text('10'), title:Text('?')),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

      
    }),
  );
}
}

// void readSearchData(var returnData) {
//   final usercol = FirebaseFirestore.instance.collection("searchData").doc();
//   usercol.get().then((value) => {
//     returnData = value.data()
//     });
// }

// void searchDataToRankList(List searchData){
//   int searchDataLen = searchData.length;
//   Set ListSet = searchData.toSet();

//   int listIndex = ListSet.length-1;
//   Map<String,int> countingAllData ;


  
//     while(true){
//       int l_Index =0;
      
//     }
//   }




// }
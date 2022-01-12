/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String author_name;
  final String author_image;
  final int age;
  final String level;
  final String mbti;
  final String movie_id;
  final String movie_title;
  final int like_count;
  final String title;
  final String text;
  final int view_count;
  final DocumentReference reference;

  Review.fromMap(Map<String, dynamic> map, {this.reference})
      : author_name = map['author_name'],
        author_image = map['author_image'],
        age = map['age'],
        level = map['level'],
        mbti = map['mbti'],
        movie_id = map['movie_id'],
        movie_title = map['movie_title'],
        text = map['text'],
        title = map['title'],
        like_count = map['like_count'],
        view_count = map['view_count'];

  Review.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Review<$movie_title:$movie_id>";
}



 */
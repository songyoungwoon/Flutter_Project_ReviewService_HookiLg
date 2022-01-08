class Movie {
  final String title;
  final String keyword;
  final String poster;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'];

  @override
  String toString() => "Movie<$title:$keyword>";
}
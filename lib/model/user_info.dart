class UserInformation {
  String email = '';
  String name = '';
  String birthdate = '';
  String nickname = '';
  String about = '';
  int level = 0;
  String imagePath = '';
  List follower = [];
  List following = [];
  List review = [];

  UserInformation();

  void setUserInfo(String email, String name, String birthdate, String nickname, String about, int level, String imagePath, List follower, List following, List review){
    this.email = email;
    this.name = name;
    this.birthdate = birthdate;
    this.nickname = nickname;
    this.about = about;
    this.imagePath = imagePath;
    this.level = level;
    this.follower = follower;
    this.following = following;
    this.review = review;
  }

  void clearUser(){
    this.imagePath = '';
    this.name = '';
    this.email = '';
    this.about = '';
    this.nickname = '';
    this.birthdate = '';
  }
  //


}

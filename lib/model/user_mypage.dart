class UserInformation {
  String imagePath;
  String name;
  String email;
  String about;
  String nickname;
  String age;

  UserInformation(
    this.imagePath,
      this.name,
    this.email,
    this.about,
    this.age,
    this.nickname
  );

  void setUserInfo(String imagePath, String name, String email, String about, String nickname, String age){
    this.imagePath = imagePath;
    this.name = name;
    this.email = email;
    this.about = about;
    this.nickname = nickname;
    this.age = age;
  }

  void clearUser(){
    // clear
  }
  //


}

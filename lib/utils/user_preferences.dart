import 'package:fp_review_service_hookilg/model/user_mypage.dart';
class UserPreferences {

  // //현재 로그인한 사용자
  // var currentUser = FirebaseAuth.instance.currentUser;
  // String? email = FirebaseAuth.instance.currentUser!.email;
  //
  //   FirebaseFirestore.instance.collection("user_info").where('email', isEqualTo : email).get().then((QuerySnapshot ds) {
  //     ds.docs.forEach((doc) => print(doc["name"]));
  //   });
  // }

  // var future = FirebaseFirestore.instance.collection("user_info").where('email', isEqualTo: email).get();
  // -> Future<QuerySnapshot<Map<String, dynamic>>>

  //프로필 그리기 전 현재 로그인한사용자있는지 확인하고
  //로그인 되어있으면 DB에서 email같은 사용자의 정보 가져와서 myUser생성해주긔..

/*
  static const myUser = UserInformation(
    imagePath:
<<<<<<< HEAD
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
=======
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'HookiLg kim',
>>>>>>> e79fc543788973dc8e1fdb585916e2c0578b76a7
    email: 'sarah.abs@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',

    age: '22',
    nickname: 'gugu'
  );
  */
}


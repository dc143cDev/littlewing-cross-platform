import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ltwcp/app/modules/home/views/home_view.dart';
import 'package:ltwcp/palette.dart';

import '../views/login_view.dart';

//사인업-로그인 컨트롤러.
//구현해야할 기능: 로그인 버튼 클릭 -> 존재하는 이메일 : 맞는 패스워드인지 확인(인증)-> 인증시 홈뷰로 이동.
//사인업 버튼 클릭 -> 텍스트 에디팅 컨트롤러로 텍스트 폼 필드에 있는 데이터를 기반으로 계정 생성-> 홈뷰로 이동.
//main-> 이니셜 라우트에 로그인 상태를 감시하여 로그인 된 상태면-> 홈뷰, 아니라면-> 로그인뷰.

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  //firebase auth 기능 가져오기
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    //유저 상태 감시, 콜백 함수 넣기 가능.
    ever(_user, _moveToPage);
  }

  // 페이지 이동 관리.
  _moveToPage(User? user) {
    //유저 데이터가 없다면, 로그인 페이지로. 있다면, 홈뷰로
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(HomeView());
    }
  }

  // 계정 데이터 생성. 에러 데이터 캐치.
  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "registerError",
        "Please Create Account",
        backgroundColor: lightBg,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Registration is failed",
          style: lightTextEng(),
        ),
      );
    }
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(HomeView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "signInError",
        "user",
        backgroundColor: lightBg,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Sign in is failed",
          style: lightTextEng(),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}

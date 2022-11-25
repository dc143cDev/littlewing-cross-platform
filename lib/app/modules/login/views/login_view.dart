import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/controllers/auth_controller.dart';
import 'package:ltwcp/app/modules/login/views/desktop_login_view.dart';
import 'package:ltwcp/app/modules/login/views/signup_view.dart';
import 'package:ltwcp/palette.dart';

import '../../../../reponsive.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

//추후 구현: 이메일 형식, 패스워드 글자수를 감시하여 유저에게 알려주는 기능.

class LoginView extends GetView<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: britishRacingGreen,
      body: Responsive.isDesktop(context)
          ? DesktopLoginView()
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      //텍스트 로고
                      LtwL(),
                      SizedBox(
                        height: 30,
                      ),
                      LineL(),
                      SizedBox(
                        height: 40,
                      ),
                      //이메일
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter email';
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontFamily: 'JS',
                          color: britishRacingGreen,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: britishRacingGreen),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          fillColor: primaryLight,
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: britishRacingGreen,
                          ),
                          hintText: 'Enter your Email',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //비밀번호
                      TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        style: TextStyle(
                          fontFamily: 'JS',
                          color: britishRacingGreen,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: britishRacingGreen),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          fillColor: primaryLight,
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: britishRacingGreen,
                          ),
                          hintText: 'Enter your Password',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //로그인 버튼
                      TextButton(
                        onPressed: () {
                          AuthController.instance.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'JS',
                            color: primaryLight,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //OR
                      Text(
                        '- OR -',
                        style: TextStyle(
                          fontFamily: 'JS',
                          color: primaryLight,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      goSignin(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

//리틀윙 텍스트 로고 로그인 화면용
class LtwL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Little Wing',
      style: TextStyle(
        fontFamily: 'LS',
        fontWeight: FontWeight.w800,
        color: primaryLight,
        fontSize: 65,
      ),
    );
  }
}

//라인 그래픽 화이트
class LineL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Container(
          color: primaryLight,
          width: 132,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: primaryLight,
          width: 15,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: primaryLight,
          width: 132,
          height: 3,
        ),
      ],
    );
  }
}

//Create Account
class goSignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(
          () => SignupView(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500),
        );
      },
      child: Text(
        'Create Account',
        style: TextStyle(
          fontFamily: 'JS',
          color: primaryLight,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}

//Login
class goLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(
          () => HomeView(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500),
        );
      },
      child: Text(
        'Login',
        style: TextStyle(
          fontFamily: 'JS',
          color: primaryLight,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}

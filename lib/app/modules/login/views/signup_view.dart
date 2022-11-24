import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/controllers/auth_controller.dart';

import '../../../../palette.dart';
import '../../home/views/home_view.dart';

class SignupView extends GetView {
  SignupView({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              LtwS(),
              SizedBox(
                height: 30,
              ),
              LineS(),
              SizedBox(
                height: 40,
              ),
              //이메일
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: 'JS',
                  color: primaryLight,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: primaryLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  fillColor: britishRacingGreen,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: primaryLight,
                  ),
                  hintText: 'Enter your Email',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //비밀번호
              TextFormField(
                controller: passwordController,
                style: TextStyle(
                  fontFamily: 'JS',
                  color: primaryLight,
                ),
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: primaryLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  fillColor: britishRacingGreen,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: primaryLight,
                  ),
                  hintText: 'Enter your Password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  AuthController.instance.register(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'JS',
                    color: britishRacingGreen,
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
                  color: britishRacingGreen,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//리틀윙 텍스트 로고 사인업용
class LtwS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Little Wing',
      style: TextStyle(
        fontFamily: 'LS',
        fontWeight: FontWeight.w800,
        color: britishRacingGreen,
        fontSize: 60,
      ),
    );
  }
}

//라인 그래픽 BRG
class LineS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Container(
          color: britishRacingGreen,
          width: 120,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: britishRacingGreen,
          width: 15,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: britishRacingGreen,
          width: 120,
          height: 3,
        ),
      ],
    );
  }
}

//SignUp
class goSignUp extends StatelessWidget {
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
        'Sign Up',
        style: TextStyle(
          fontFamily: 'JS',
          color: britishRacingGreen,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}

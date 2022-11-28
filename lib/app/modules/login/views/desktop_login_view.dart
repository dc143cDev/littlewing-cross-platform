import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class DesktopLoginView extends GetView {
  DesktopLoginView({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: britishRacingGreen,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 180, horizontal: 120),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //텍스트 로고
                Expanded(
                  child: SizedBox(height: 150, width: 150, child: LtwL()),
                ),
                SizedBox(
                  width: 50,
                ),

                LineS(),
                SizedBox(
                  width: 120,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                //이메일
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryLight,
          height: 132,
          width: 3,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: primaryLight,
          height: 15,
          width: 3,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: primaryLight,
          height: 132,
          width: 3,
        ),
      ],
    );
  }
}

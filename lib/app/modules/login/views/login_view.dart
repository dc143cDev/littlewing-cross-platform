import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/palette.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: britishRacingGreen,
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              LtwL(),
              SizedBox(
                height: 30,
              ),
              LineL(),
              SizedBox(
                height: 30,
              ),
              TextFormField(),
              TextFormField(),
            ],
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
        fontSize: 60,
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
          width: 6,
        ),
        Container(
          color: primaryLight,
          width: 120,
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
          width: 120,
          height: 3,
        ),
      ],
    );
  }
}

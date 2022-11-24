import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class SignupView extends GetView {
  const SignupView({Key? key}) : super(key: key);
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
          width: 6,
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

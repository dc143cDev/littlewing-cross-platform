import 'package:flutter/material.dart';

//색상 팔레트. 테마 변경시 라이트 다크 치환.
const britishRacingGreen = Color(0xFF004225);

//라이트
const primaryLight = Color(0xFFFDFEFF);
const lightBg = Color(0xFFDADBDD);

//다크
const primaryDark = Color(0xFF16161B);
const darkBg = Color(0xFF383B39);

//폰트 컬러

//폰트 테마. 폰트가 쓰이는 곳이 명칭의 기준.
accentFont() {
  return const TextStyle(
    fontFamily: 'LS',
    fontWeight: FontWeight.w700,
    color: britishRacingGreen,
  );
}

lightTextEng() {
  return const TextStyle(
    fontFamily: 'JS',
    fontWeight: FontWeight.w300,
    color: primaryDark,
  );
}

darkTextEng() {
  return const TextStyle(
    fontFamily: 'JS',
    fontWeight: FontWeight.w300,
    color: primaryLight,
  );
}

class Ltw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Little Wing',
      style: TextStyle(
        fontFamily: 'LS',
        fontWeight: FontWeight.w800,
        color: britishRacingGreen,
        fontSize: 30,
      ),
    );
  }
}

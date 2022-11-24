import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/views/login_view.dart';
import 'package:ltwcp/app/modules/login/views/signup_view.dart';
import 'package:ltwcp/palette.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Ltw(),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        color: primaryLight,
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

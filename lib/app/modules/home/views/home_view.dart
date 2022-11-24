import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/views/login_view.dart';
import 'package:ltwcp/app/modules/login/views/signup_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            FloatingActionButton(
                heroTag: null,
                child: Text('lg'),
                onPressed: () {
                  Get.to(LoginView());
                }),
            FloatingActionButton(
                child: Text('si'),
                onPressed: () {
                  Get.to(SignupView());
                }),
          ],
        ),
      ),
    );
  }
}

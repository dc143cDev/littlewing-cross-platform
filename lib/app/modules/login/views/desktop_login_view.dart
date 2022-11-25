import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DesktopLoginView extends GetView {
  const DesktopLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DesktopLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ltwcp/app/modules/my/views/desktop_my_view.dart';
import 'package:ltwcp/palette.dart';

import '../../../../reponsive.dart';
import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: Responsive.isDesktop(context)
          ? DesktopMyView()
          : Center(
              child: Text(
                'MyView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}

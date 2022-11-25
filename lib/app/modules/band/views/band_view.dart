import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/band_controller.dart';

class BandView extends GetView<BandController> {
  const BandView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Ltw(),
        centerTitle: false,
        elevation: 0,
        actions: [
          FloatingActionButton(
            onPressed: () {},
            child: Text('2'),
          )
        ],
      ),
      body: Center(
        child: Text(
          'BandView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

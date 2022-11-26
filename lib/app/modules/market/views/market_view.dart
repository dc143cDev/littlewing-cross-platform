import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Ltw(),
        centerTitle: false,
        elevation: 0,
        actions: [],
      ),
      body: Center(
        child: Text(
          'MarketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ltwcp/app/modules/band/views/band_view.dart';
import 'package:ltwcp/app/modules/market/views/market_view.dart';
import 'package:ltwcp/app/modules/my/views/my_view.dart';
import 'package:ltwcp/palette.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> pages = [
    MarketView(),
    BandView(),
    MyView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Band'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'MyPage'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}

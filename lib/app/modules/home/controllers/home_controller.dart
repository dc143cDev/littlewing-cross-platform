import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

// List<Widget> ResponsiveAppbar(BuildContext context) {
//   if (selectedIndex == 0) {
//     return marketAction;
//   } else if (selectedIndex == 1) {
//     return bandAction;
//   } else if (selectedIndex == 2) {
//     return myPageAction;
//   }
// }

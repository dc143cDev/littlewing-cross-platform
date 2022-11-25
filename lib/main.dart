import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ltwcp/app/modules/login/controllers/auth_controller.dart';
import 'package:ltwcp/firebase_options.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      //이니셜 라우트 유저 상태 감지하여 네비게이션
      // initialRoute: Routes.LOGIN,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      getPages: AppPages.routes,
    ),
  );
}

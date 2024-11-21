import 'dart:ui';

import 'package:doodle_shree/authservice.dart';
import 'package:doodle_shree/screen/Landingscreen.dart';
import 'package:doodle_shree/screen/homescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 1)).then((value) async {
      if (await AuthService.islogin()) {
        Get.offAll(ScreenUtilInit(
          designSize: Size(390, 844),
          child: Homescreen(),
        ));
      } else {
        Get.offAll(ScreenUtilInit(
          designSize: Size(390, 844),
          child: LandingScreen(),
        ));
      }
    });
  }
}

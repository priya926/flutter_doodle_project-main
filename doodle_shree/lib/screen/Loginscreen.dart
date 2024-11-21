
import 'package:doodle_shree/components/textfieldbox.dart';
import 'package:doodle_shree/controller/auth.controller.dart';
import 'package:doodle_shree/screen/SignupScreen.dart';
import 'package:doodle_shree/screen/forgetpasswod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 61.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(
          bottom: BorderSide(),
        ),
        leadingWidth: 40.w,
        title: Container(
          height: 55.h,
          child: Image.asset('assets/PNG/doodleLogo.png'),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 254, 242, 232),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 43.h,
                  ),
                  SvgPicture.asset(
                    'assets/SVG/loginsvg.svg',
                    height: 213.h,
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "👋 Hey, Welcome back!\nWe’re happy to see you again 😊",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox("Email", authController, controller.email);
                  }),
                  SizedBox(
                    height: 18.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox(
                        "Password", authController, controller.password);
                  }),
                  GetBuilder<AuthController>(builder: (controller) {
                    return Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 32.w),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.off(() => Forgetpasswod());
                        },
                        child: Text(
                          "Forget password",
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    );
                  }),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.Login(_scaffoldKey);
                      },
                      child: Container(
                        height: 45.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(7.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              // blurRadius: 7.r,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 18.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account ? ",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SignupScreen();
                              },
                            ));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Text(
                          " now",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return Obx(
              () => controller.isloading.value
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.blueGrey.shade100.withOpacity(0.4),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            );
          }),
        ],
      ),
    );
  }
}

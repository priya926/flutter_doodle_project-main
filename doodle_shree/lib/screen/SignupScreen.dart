
import 'package:doodle_shree/components/textfieldbox.dart';
import 'package:doodle_shree/controller/auth.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
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
                    height: 60.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    width: double.infinity,
                    child: Text(
                      "Create account, Your personalized \ndoodle paradise awaits!",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox(
                        "Full Name", authController, controller.fullname);
                  }),
                  SizedBox(
                    height: 18.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox(
                        "Username", authController, controller.username);
                  }),
                  SizedBox(
                    height: 18.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox("Email", authController, controller.email);
                  }),
                  SizedBox(
                    height: 18.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox(
                      "Password",
                      authController,
                      controller.password,
                      ishide: true,
                    );
                  }),
                  SizedBox(
                    height: 18.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InputBox("Confrim Password", authController,
                        controller.cpassword);
                  }),
                  SizedBox(
                    height: 34.h,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.Signup(_scaffoldKey);
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
                          "Signup",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
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

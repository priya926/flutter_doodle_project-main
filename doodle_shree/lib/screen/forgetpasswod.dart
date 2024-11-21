
import 'package:doodle_shree/components/textfieldbox.dart';
import 'package:doodle_shree/controller/auth.controller.dart';
import 'package:doodle_shree/screen/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Forgetpasswod extends StatelessWidget {
  Forgetpasswod({super.key});
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
        title: Text(
          "Doodle",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return Obx(
                  () => controller.issent.value
                      ? SendedLink()
                      : Sentlink(_scaffoldKey, authController),
                );
              },
            ),
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return Obx(
              () => controller.isloading.value
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.blueGrey.withOpacity(0.4),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            );
          }),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 254, 242, 232),
    );
  }
}

class SendedLink extends StatelessWidget {
  const SendedLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 200.h,
                child: Image.asset(
                  'assets/PNG/emailsend.png',
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                child: Text(
                  "Check your mail",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                child: Text(
                  "Please check your email.\nWe have sent you an email that contains\na link to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GetBuilder<AuthController>(builder: (controller) {
                return InkWell(
                  onTap: () {
                    controller.issent.value = false;
                    Get.off(() => LoginScreen());
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
                      "Back to Login",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 18.h,
            ),
            child: Text(
              "Did not receive the email? Check your spam\nfilter or try another email address",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sentlink extends StatelessWidget {
  GlobalKey<ScaffoldState> _globalKey;
  final AuthController authController;
  Sentlink(this._globalKey, this.authController, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          width: double.infinity,
          child: Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Text(
            "Enter the email associated with your account and we will send an email with instrucrions to reset your password.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        GetBuilder<AuthController>(builder: (controller) {
          return InputBox(
            "Email",
            authController,
            controller.email,
          );
        }),
        SizedBox(
          height: 30.h,
        ),
        GetBuilder<AuthController>(builder: (controller) {
          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.Forget(_globalKey);
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
                "Send Link",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

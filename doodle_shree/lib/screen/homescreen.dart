import 'package:doodle_shree/authservice.dart';
import 'package:doodle_shree/screen/Landingscreen.dart';
import 'package:doodle_shree/screen/doodling_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 61.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(
          bottom: BorderSide(),
        ),
        title: Container(
          height: 55.h,
          child: Image.asset('assets/PNG/doodleLogo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              AuthService.deleteuser();
              Get.offAll(() => const LandingScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 254, 242, 232),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 250.h,
                child: LottieBuilder.asset(
                  'assets/lottie/emoji.json',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "welcome to dashboard!",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Get ready to make your own doodles.",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => DoodlingScreen()),
                        (route) => true);
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
                      "Start Doodling",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

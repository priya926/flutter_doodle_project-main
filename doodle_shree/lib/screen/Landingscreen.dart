
import 'package:doodle_shree/screen/Loginscreen.dart';
import 'package:doodle_shree/screen/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 61.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "Signup",
                style: TextStyle(
                  fontSize: 13.sp,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(7.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                    )
                  ]),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 13.sp,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 254, 242, 232),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      height: 100.h,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            height: 100.h,
                            alignment: Alignment.center,
                            child: Image.asset('assets/PNG/doodleLogo.png'),
                          ),
                          Positioned(
                            top: 0.h,
                            right: 75.w,
                            child: SvgPicture.asset(
                              "assets/SVG/arrow.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                "assets/SVG/arrow1.svg",
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              "Presented by\n-Half Engineers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      // height: 211.h,
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Avatar("Pratiksha Chavan", "Software Engginer"),
                              SizedBox(
                                width: 10.w,
                              ),
                              Avatar("Anubhuti Priya", "FullStack"),
                              SizedBox(
                                width: 10.w,
                              ),
                              Avatar("Gauri Bhagwat", "frontend"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                color: const Color.fromARGB(255, 254, 242, 232),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "What is ",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 60.w,
                          // height: 35.h,
                          child: Image.asset(
                            'assets/PNG/doodleLogo.png',
                          ),
                        ),
                        Text(
                          " ?",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "A real-time collaborative doodling app built with Flutter and Firebase. Users can create and share digital canvases, draw together in real-time, and save their creations to the cloud. The app leverages Flutter for a smooth, cross-platform drawing experience and Firebase for authentication, real-time data synchronization, and cloud storage.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Additional Info :",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 900.h,
                    //   child: ListView.builder(
                    //     itemCount: 6,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (context, index) {
                    //       return Engineers();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  String name;
  String role;
  Avatar(this.name, this.role, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PNG/avatar.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            role,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class Engineers extends StatelessWidget {
  const Engineers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 62.h,
            width: 62.w,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/PNG/avatar.png'),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Software",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Vishal",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  "A real-time collaborative doodling app built with Flutter and Firebase.A real-time collaborative doodling app built with Flutter and Firebase.",
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

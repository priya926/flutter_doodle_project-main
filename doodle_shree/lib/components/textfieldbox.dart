

import 'package:doodle_shree/controller/auth.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class InputBox extends StatelessWidget {
  String Inputtype;
  bool ishide;
  TextEditingController Textcontroller;
  final AuthController controller;
  InputBox(this.Inputtype, this.controller, this.Textcontroller,
      {this.ishide = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 28.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            Inputtype,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return Obx(
              () => Container(
                height: 45.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(),
                ),
                child: TextField(
                  obscureText: controller.hide.value && ishide,
                  controller: Textcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter ${Inputtype}",
                    suffixIcon: ishide
                        ? IconButton(
                            onPressed: () {
                              controller.hide.value = !controller.hide.value;
                            },
                            icon: Icon(
                              controller.hide.value
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}



// class InputBox extends StatefulWidget {
//   String Inputtype;
//   bool ishide;
//   TextEditingController Textcontroller;
//   final AuthController controller;
//   InputBox(this.Inputtype, this.controller, this.Textcontroller,
//       {this.ishide = false, super.key});

//   @override
//   State<InputBox> createState() => _InputBoxState();
// }

// class _InputBoxState extends State<InputBox> {
//   bool hide = true;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: 28.w,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             widget.Inputtype,
//             style: TextStyle(
//               fontSize: 16.sp,
//             ),
//           ),
//           Container(
//             height: 45.h,
//             padding: EdgeInsets.symmetric(
//               horizontal: 10.w,
//             ),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(7.r),
//               border: Border.all(),
//             ),
//             child: TextField(
//               obscureText: hide && widget.ishide,
//               controller: widget.Textcontroller,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Enter ${widget.Inputtype}",
//                 suffixIcon: widget.ishide
//                     ? IconButton(
//                         onPressed: () {
//                           hide = !hide;
//                           if (mounted) {
//                             setState(() {});
//                           }
//                         },
//                         icon: Icon(
//                           hide
//                               ? Icons.remove_red_eye
//                               : Icons.remove_red_eye_outlined,
//                         ),
//                       )
//                     : null,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

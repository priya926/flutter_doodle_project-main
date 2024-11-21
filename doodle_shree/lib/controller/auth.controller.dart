import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doodle_shree/authservice.dart';
import 'package:doodle_shree/models/user.model.dart';
import 'package:doodle_shree/screen/homescreen.dart';
import 'package:doodle_shree/utils/snakbar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  RxBool isloading = false.obs;
  RxBool issent = false.obs;
  RxBool hide = true.obs;

  Future Forget(GlobalKey<ScaffoldState> _scaffoldKey) async {
    try {
      isloading.value = true;
      final auth =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      issent.value = true;
      email.clear();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      showtoast(_scaffoldKey, "something went wrong", true);
      print("Error $e");
    }
  }

  Future Login(GlobalKey<ScaffoldState> _scaffoldKey) async {
    try {
      isloading.value = true;
      final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (auth.user?.uid != null) {
        final getuser = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: auth.user?.uid)
            .get();
        await AuthService.setlogin(
          UserModel(
              email: getuser.docs[0]['email'],
              fullname: getuser.docs[0]['fullname'],
              username: getuser.docs[0]['username'],
              id: auth.user!.uid),
        );
      }
      email.clear();
      password.clear();
      if (await AuthService.islogin()) {
        Get.offAll(() => const Homescreen());
      }
      isloading.value = false;
      showtoast(_scaffoldKey, "Logedin Sucessfully", false);
    } catch (e) {
      if (kDebugMode) {
        print("error :- ${e}");
      }
      isloading.value = false;
      showtoast(_scaffoldKey, "please check your credential", true);
    }
  }

  Future Signup(GlobalKey<ScaffoldState> _scaffoldKey) async {
    try {
      isloading.value = true;
      if (password.text != cpassword.text) {
        showtoast(_scaffoldKey, "Password does not match", true);
        return false;
      }
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      if (auth.user?.uid != null) {
        await FirebaseFirestore.instance.collection('users').add({
          'username': username.text.trim(),
          'fullname': fullname.text.trim(),
          'email': email.text.trim(),
          'id': auth.user?.uid.trim(),
        });
        await AuthService.setlogin(
          UserModel(
              email: email.text.trim(),
              fullname: fullname.text.trim(),
              username: username.text.trim(),
              id: auth.user!.uid.trim()),
        );
      }
      email.clear();
      username.clear();
      fullname.clear();
      password.clear();
      cpassword.clear();
      if (await AuthService.islogin()) {
        Get.offAll(() => const Homescreen());
      }
      isloading.value = false;
      showtoast(_scaffoldKey, "Signedin Sucessfully", false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showtoast(_scaffoldKey, "The password provided is too weak.", true);
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        showtoast(
            _scaffoldKey, "The account already exists for that email.", true);
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
      isloading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print("error :=$e");
      }
      isloading.value = false;
    }
  }
}

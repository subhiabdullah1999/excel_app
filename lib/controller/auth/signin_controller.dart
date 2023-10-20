// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:monitoringdata_excel/core/services/services.dart';

abstract class SignInController extends GetxController {
  goToLogin();
  signInWitheFirebase();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> keyformstate = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  MyServices myServices = Get.find();
  CollectionReference myUser = FirebaseFirestore.instance.collection('myUser');

  bool isShowPass = true;
  String? conPass;
  String? pass;
  int aprove = 0;

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phoneNumber = TextEditingController();

    super.onInit();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutsName.login);
  }

  showPassWoord() {
    if (isShowPass == false) {
      isShowPass = true;
    } else {
      isShowPass = false;
    }
    update();
  }

  addUser() async {
    // Call the user's CollectionReference to add a new user
    if (keyformstate.currentState!.validate()) {
      try {
        await myUser
            .add({
              'id': FirebaseAuth.instance.currentUser!.uid,
              'email': email.text,
              "aprove": aprove,
              "name": userName.text
            })
            .then((value) =>
                // ignore: avoid_print
                print("===================User Added======================="))
            // ignore: avoid_print
            .catchError((error) => print("Failed to add user: $error"));
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }

  @override
  signInWitheFirebase() async {
    if (keyformstate.currentState!.validate()) {
      try {
        Get.defaultDialog(
          content: Column(
            children: [
              Text("...جار انشاء الحساب"),
              CircularProgressIndicator()
            ],
          ),
        );
        update();
        // ignore: unused_local_variable
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        myServices.sharedPreferences
            .setString("userName", userName.text)
            .toString();
        myServices.sharedPreferences.setString("email", email.text).toString();
        myServices.sharedPreferences
            .setString("phoneNumber", phoneNumber.text)
            .toString();

        Get.showSnackbar(GetSnackBar(
          duration: Duration(milliseconds: 3000),
          backgroundColor: AppColors.oraColor,
          borderRadius: 20,
          title: "تهانينا",
          message:
              "تم انشاء الحساب بنجاح ..الرجاء التوجه الى بريدك الالكتروني وتأكيد الحساب",
        ));
        addUser();

        Get.offAllNamed(AppRoutsName.login);
      } on FirebaseAuthException catch (e) {
        Get.back();

        if (e.code == 'weak-password') {
          Get.defaultDialog(
            content: Column(
              children: const [Text("خطأ"), Text("كلمة المرور ضعيفة ")],
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          Get.defaultDialog(
            content: Column(
              children: const [Text("خطأ"), Text("الايميل موجود سابقا")],
            ),
          );
        }
      } catch (e) {
        Get.defaultDialog(
          content: Column(
            children: const [Text("خطأ"), Text("حصل خطأ غير متوقع ")],
          ),
        );
      }
    }

    update();
  }
}

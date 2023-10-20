// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:monitoringdata_excel/core/services/services.dart';

abstract class LogInController extends GetxController {
  goToSignUp();
  showPassWoord();
  logInWithFairebase();
  forgetPassword();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState> keyFormstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();

  bool isShowPass = true;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutsName.signUp);
  }

  @override
  showPassWoord() {
    if (isShowPass == false) {
      isShowPass = true;
    } else {
      isShowPass = false;
    }
    update();
  }

  @override
  logInWithFairebase() async {
    if (keyFormstate.currentState!.validate()) {
      try {
        Get.defaultDialog(
          content: Column(
            children: const [
              Text("...جار تسجيل الدخول"),
              CircularProgressIndicator()
            ],
          ),
        );
        update();

        // ignore: unused_local_variable
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Get.showSnackbar(GetSnackBar(
            duration: Duration(milliseconds: 2000),
            backgroundColor: AppColors.oraColor,
            borderRadius: 20,
            title: "تهانينا",
            message: "تم تسجيل الدخول بنجاح",
          ));
          myServices.sharedPreferences
              .setString("email", email.text)
              .toString();

          Get.toNamed(AppRoutsName.home);
        } else {
          Get.back();

          Get.showSnackbar(GetSnackBar(
            duration: Duration(milliseconds: 3000),
            backgroundColor: AppColors.oraColor,
            borderRadius: 20,
            title: "خطأ",
            message: " الرجاء التوجه الى بريدك الالكتروني وتأكيد حسابك",
          ));
        }
        update();
      } on FirebaseAuthException catch (e) {
        Get.back();

        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          Get.showSnackbar(GetSnackBar(
            duration: Duration(milliseconds: 3000),
            backgroundColor: AppColors.redcolor,
            borderRadius: 5,
            title: "خطأ",
            message: "معلومات الحساب غير صحيحة",
          ));

          update();
        } else if (e.code == 'wrong-password') {
          Get.showSnackbar(GetSnackBar(
            duration: Duration(milliseconds: 3000),
            backgroundColor: AppColors.redcolor,
            borderRadius: 5,
            title: "خطأ",
            message: "معلومات الحساب غير صحيحة",
          ));
          update();
        }
      }
    }
    update();
  }

  @override
  forgetPassword() async {
    // ignore: unnecessary_null_comparison
    if (email.text == "" || email.text == null) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: AppColors.gry,
        borderRadius: 5,
        title: "تنبيه",
        message:
            "يرجى ادخال ايميلك في حقل الايميل لنتمكن من مساعدتك في تعين كلمة مرور جديدة",
      ));
      update();
    } else {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      Get.showSnackbar(GetSnackBar(
        duration: Duration(milliseconds: 3500),
        backgroundColor: AppColors.gry,
        borderRadius: 5,
        title: "تنبيه",
        message:
            "تم ارسال ايميل الى بريدك الالكتروني لاعادة تعين كلمة المرور يرجى التوجه الى بريدك لتعين كلمة مرور جديدة",
      ));
      update();
    }
  }
}

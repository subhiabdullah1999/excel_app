import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:monitoringdata_excel/core/services/services.dart';

abstract class ProfileController extends GetxController {
  goToChanePassord();
  goBack();

  iconEditeProfile();
}

class ProfileControllerImp extends ProfileController {
  late TextEditingController userName;
  late TextEditingController phonenumber;
  late TextEditingController emaile;
  MyServices myServices = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  goToChanePassord() {
    // Get.toNamed(AppRoutsName.chanePassword);
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  iconEditeProfile() {
    if (formstate.currentState!.validate()) {
      myServices.sharedPreferences.clear();
      myServices.sharedPreferences
          .setString("userName", userName.text)
          .toString();
      myServices.sharedPreferences.setString("email", emaile.text).toString();
      myServices.sharedPreferences
          .setString("phoneNumber", phonenumber.text)
          .toString();

      Get.showSnackbar(const GetSnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: AppColors.oraColor,
        borderRadius: 20,
        title: "تهانينا",
        message: "تم تحديث معلومات الملف الشخصي بنجاح",
      ));
      Get.offNamed(AppRoutsName.home);
    }
    update();
  }

  @override
  void onInit() {
    userName = TextEditingController(
      text: myServices.sharedPreferences.getString("userName") == null
          ? ""
          : myServices.sharedPreferences.getString("userName")!,
    );
    phonenumber = TextEditingController(
      text: myServices.sharedPreferences.getString("phoneNumber") == null
          ? ""
          : myServices.sharedPreferences.getString("phoneNumber")!,
    );
    emaile = TextEditingController(
      text: myServices.sharedPreferences.getString("email") == null
          ? ""
          : myServices.sharedPreferences.getString("email")!,
    );

    super.onInit();
  }
}

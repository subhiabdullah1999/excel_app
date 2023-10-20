// ignore_for_file: file_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appthem.dart';
import 'package:monitoringdata_excel/core/services/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalizationController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themEnglish;
  bool isMyFilesDirectoryCreated = false;

  checkFileMyExcelIsFound() async {
    final directory = await getExternalStorageDirectory();
    final path = directory!.path;

    String newPath = "";
    List<String> folders = path.split("/");

    for (int x = 1; x < folders.length; x++) {
      String folder = folders[x];
      if (folder != "Android") {
        newPath += "/$folder";
      } else {
        break;
      }
    }
    // newPath = "$newPath/Download";
    Directory myFilesDirectory = Directory('$newPath/Download/myExcel');
    if (!myFilesDirectory.existsSync()) {
      // إذا لم يكن موجودًا، فقم بإنشائه
      myFilesDirectory.createSync();
      update();
    }
  }

  permissionStoragetow() async {
    PermissionStatus status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
    } else {
      await Permission.storage.request();
    }
    update();
  }

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);

    // ignore: unrelated_type_equality_checks
    appTheme = locale == "ar" ? themArabic : themEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrifLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrifLang == "ar") {
      language = const Locale("ar");
      appTheme = themArabic;
    } else if (sharedPrifLang == "en") {
      language = const Locale("en");
      appTheme = themEnglish;
    } else {
      // language = Locale(Get.deviceLocale!.languageCode);
      // appTheme = themEnglish;
    }
// ============== status user on firebase===================
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {}
    });

    permissionStoragetow();

    super.onInit();
  }
}

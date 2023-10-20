import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

Future<bool> alertDialogExitApp() {
  Get.defaultDialog(
    titlePadding: const EdgeInsets.all(10),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    title: "waring",
    backgroundColor: AppColors.whiteColor,
    content: const Text("Exit the application"),
    confirm: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("ok".tr)),
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: ElevatedButton(
          onPressed: () {
            Get.back(canPop: false);
          },
          child: Text("cancel".tr)),
    ),
  );
  return Future.value(true);
}

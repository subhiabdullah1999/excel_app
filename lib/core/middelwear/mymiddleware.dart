import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      // return RouteSettings(name: AppRoutsName.homebuttonApbar);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      // return RouteSettings(name: AppRoutsName.login);
    }
    return null;
  }
}

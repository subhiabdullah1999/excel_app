import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:monitoringdata_excel/core/localizations/localizationController.dart';
import 'package:monitoringdata_excel/core/localizations/translation.dart';
import 'package:monitoringdata_excel/core/services/services.dart';
import 'package:monitoringdata_excel/routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalizationController controller = Get.put(LocalizationController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      //  initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'My Meal On',
      theme: controller.appTheme,

      getPages: routes,
    );
  }
}

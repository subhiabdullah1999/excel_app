import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:csv/csv.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:monitoringdata_excel/core/services/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:rive/rive.dart';

abstract class HomeController extends GetxController {
  logOut();
}

class HomeControllerImp extends HomeController {
  // TextEditingControllerWellNo
  late TextEditingController? wellNoController;
  late TextEditingController? timeWellNoController;

  // TextEditingController

  // TextEditingControllerRequancy
  late TextEditingController? frequancyController;
  late TextEditingController? asampAController;
  late TextEditingController? asampBController;
  late TextEditingController? asampCController;
  late TextEditingController? valtAController;
  late TextEditingController? valtBController;
  late TextEditingController? valtCController;
  // TextEditingControllerRequancy

  // TextEditingControllerSurface data
  late TextEditingController? wHPController;
  late TextEditingController? fLPController;
  late TextEditingController? fuelController;
  late TextEditingController? tancCapcityController;
  late TextEditingController? panelOwnerController;
  late TextEditingController? leftChockSizeController;
  late TextEditingController? rightChockSizeController;
  // TextEditingControllerRequancy

  // TextEditingControllerS downhole data
  late TextEditingController? piController;
  late TextEditingController? pdController;
  late TextEditingController? tiController;
  late TextEditingController? tmController;
  late TextEditingController? vxController;
  late TextEditingController? vyController;
  late TextEditingController? ciaController;
  late TextEditingController? cipController;

  // TextEditingControllerS downhole data

  // TextEditingControllerS Contact data
  late TextEditingController? nameController;
  late TextEditingController? emailController;
  late TextEditingController? mobileController;

  // TextEditingControllerS Contact data

  // TextEditingControllerS Remarks
  late TextEditingController? remarkController;
  //  TextEditingControllerS Remarks

//  ============getAprove===========

  int? aprove;
  List data = [];
  getAprove() async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection("myUser")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.add(res.docs);

    aprove = data[0][0]["aprove"];
  }
//  ============getAprove===========

  MyServices myServices = Get.find();

  bool isOpenMenuSide = false;

  Object choStatuse = "ON";
  List liststatus = ["ON", "OFF"];
  // -----------
  Object? choSurfaceone = "Elbow";
  List listSurfaceone = [
    "Elbow",
    "Adjustable",
  ];
  // -----------
  Object? chosLeftChockStatuse = "Open";
  List listLeftChockStatuse = [
    "Open",
    "Close",
  ];

  // -----------
  Object? chosRightChockType = "Elbow";
  List listRightChockType = [
    "Elbow",
    "Manuale(Adjustable Type)",
  ];
  // -----------
  Object? chosRightChockStatus = "Open";
  List listRightChockStatus = [
    "Open",
    "Close",
  ];

  // -----------
  Object? chosLocationStatus = "Good";
  List listLocationStatus = [
    "Good",
    "Bad",
  ];

  changeChosStatus() {
    update();
  }

  // ===date===

  int dateyear = DateTime.now().year;
  int dateMonth = DateTime.now().month;
  int dateday = DateTime.now().month;

  String dateTime = "";

//================================
  List<List<dynamic>> rows = [];

  void addData() {
    if (aprove == 0) {
      Get.defaultDialog(
        content: Column(
          children: const [
            CircleAvatar(
              radius: 40,
              child: RiveAnimation.asset(
                "assets/riveAssets/error.riv",
              ),
            ),
            Text(
              "تحتاج الى موافقة الادمن للعمل",
              style: TextStyle(
                  color: AppColors.blackColor3,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      );
      update();
    } else {
      rows.add([
        wellNoController!.text,
        dateTime,
        timeWellNoController!.text,
        choStatuse,
        frequancyController!.text,
        asampAController!.text,
        asampBController!.text,
        asampCController!.text,
        valtAController!.text,
        valtBController!.text,
        valtCController!.text,
        piController!.text,
        pdController!.text,
        tiController!.text,
        tmController!.text,
        vxController!.text,
        vyController!.text,
        ciaController!.text,
        cipController!.text,
        wHPController!.text,
        fLPController!.text,
        fuelController!.text,
        tancCapcityController!.text,
        remarkController!.text,
        panelOwnerController!.text,
        leftChockSizeController!.text,
        choSurfaceone,
        chosLeftChockStatuse,
        rightChockSizeController!.text,
        chosRightChockType,
        chosRightChockStatus,
        chosLocationStatus,
        nameController!.text,
        emailController!.text,
        mobileController!.text,
      ]);

      // snackbar
      Get.snackbar("نجاح", "تم حفظ البيانات المدخلة");
    }
  }

  clearRows() {
    wellNoController!.clear();
    timeWellNoController!.clear();
    frequancyController!.clear();
    asampAController!.clear();
    asampBController!.clear();
    asampCController!.clear();
    valtAController!.clear();
    valtBController!.clear();
    valtCController!.clear();
    wHPController!.clear();
    fLPController!.clear();
    fuelController!.clear();
    tancCapcityController!.clear();
    panelOwnerController!.clear();
    leftChockSizeController!.clear();
    rightChockSizeController!.clear();
    piController!.clear();
    pdController!.clear();
    tiController!.clear();
    tmController!.clear();
    vxController!.clear();
    vyController!.clear();
    ciaController!.clear();
    cipController!.clear();
    // nameController!.clear();
    // emailController!.clear();
    // mobileController!.clear();
    remarkController!.clear();
  }

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

  void exportData() async {
    if (aprove == 0) {
      Get.defaultDialog(
        content: Column(
          children: const [
            CircleAvatar(
              radius: 40,
              child: RiveAnimation.asset(
                "assets/riveAssets/error.riv",
              ),
            ),
            Text(
              "تحتاج الى موافقة الادمن للعمل",
              style: TextStyle(
                  color: AppColors.blackColor3,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      );
      update();
    } else {
      PermissionStatus status = await Permission.manageExternalStorage.status;
      PermissionStatus status2 = await Permission.storage.status;

      if (status == PermissionStatus.granted) {
        List<List<dynamic>> csvData = [
          [
            'Well',
            'Date',
            'Time',
            'ONOFF',
            'HZ',
            'A',
            'B',
            'C',
            'AB',
            'Bc',
            'CA',
            'Pi',
            'Pd',
            'Ti',
            'Tm',
            'VibX',
            'VibY',
            'Cla',
            'Clp',
            'WHP',
            'FLP',
            'Fuel',
            'TankCapacity',
            'Remarks',
            'SB/Vsd',
            'left_Choke_Size',
            'left_Choke_Type',
            'left_Choke_Status',
            'Right_Choke_Size',
            'Right_Choke_Type',
            'Right_Choke_Status',
            "LocationStatus",
            'Person',
            'Email',
            'Phone Number',
            'CIP'
          ],
          ...rows,
        ];
        checkFileMyExcelIsFound();

        String csv = const ListToCsvConverter().convert(csvData);

        // final directory = await getExternalStorageDirectory();
        final Directory? directory = await getExternalStorageDirectory();

        final path = directory!.path;

        String newPath = "";
        List<String> folders = path.split("/");
        final years = DateTime.now().year.toString();
        final mon = DateTime.now().month.toString();
        final days = DateTime.now().day.toString();
        final hours = DateTime.now().hour.toString();
        final minutes = DateTime.now().minute.toString();
        final fullname = "$years-$mon-$days-  $hours & $minutes".toString();

        final filename = '$fullname.csv';

        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }

        newPath = "$newPath/Download/myExcel";

        final file = File("$newPath/$filename");

        await file.writeAsString(csv);

        Get.showSnackbar(GetSnackBar(
          borderRadius: 20,
          title: "تم تصدير الملف الى ",
          messageText: Column(
            children: [
              Text(newPath),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                color: AppColors.whiteColor,
                child: const Text("Ok"),
              ),
            ],
          ),
        ));
      } else {
        await Permission.manageExternalStorage.request();
      }
      update();

      if (status2 == PermissionStatus.granted) {
        List<List<dynamic>> csvData = [
          [
            'Well',
            'Date',
            'Time',
            'ONOFF',
            'HZ',
            'A',
            'B',
            'C',
            'AB',
            'Bc',
            'CA',
            'Pi',
            'Pd',
            'Ti',
            'Tm',
            'VibX',
            'VibY',
            'Cla',
            'Clp',
            'WHP',
            'FLP',
            'Fuel',
            'TankCapacity',
            'Remarks',
            'SB/Vsd',
            'left_Choke_Size',
            'left_Choke_Type',
            'left_Choke_Status',
            'Right_Choke_Size',
            'Right_Choke_Type',
            'Right_Choke_Status',
            "LocationStatus",
            'Person',
            'Email',
            'Phone Number',
            'CIP'
          ],
          ...rows,
        ];
        checkFileMyExcelIsFound();

        String csv = const ListToCsvConverter().convert(csvData);

        // final directory = await getExternalStorageDirectory();
        final Directory? directory = await getExternalStorageDirectory();

        final path = directory!.path;

        String newPath = "";
        List<String> folders = path.split("/");
        final years = DateTime.now().year.toString();
        final mon = DateTime.now().month.toString();
        final days = DateTime.now().day.toString();
        final hours = DateTime.now().hour.toString();
        final minutes = DateTime.now().minute.toString();
        final fullname = "$years-$mon-$days-  $hours & $minutes".toString();

        final filename = '$fullname.csv';

        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }

        newPath = "$newPath/Download/myExcel";

        final file = File("$newPath/$filename");

        await file.writeAsString(csv);

        Get.showSnackbar(GetSnackBar(
          borderRadius: 20,
          title: "تم تصدير الملف الى ",
          messageText: Column(
            children: [
              Text(newPath),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                color: AppColors.whiteColor,
                child: const Text("Ok"),
              ),
            ],
          ),
        ));
      } else {
        await Permission.storage.request();
      }
      update();
    }

    update();
  }

//================================

  @override
  void onInit() {
    wellNoController = TextEditingController();
    timeWellNoController = TextEditingController();
    frequancyController = TextEditingController();
    asampAController = TextEditingController();
    asampBController = TextEditingController();
    asampCController = TextEditingController();
    valtAController = TextEditingController();
    valtBController = TextEditingController();
    valtCController = TextEditingController();
    wHPController = TextEditingController();
    fLPController = TextEditingController();
    fuelController = TextEditingController();
    tancCapcityController = TextEditingController();
    panelOwnerController = TextEditingController();
    leftChockSizeController = TextEditingController();
    rightChockSizeController = TextEditingController();

    piController = TextEditingController();
    pdController = TextEditingController();
    tiController = TextEditingController();
    tmController = TextEditingController();
    vxController = TextEditingController();
    vyController = TextEditingController();
    ciaController = TextEditingController();
    cipController = TextEditingController();

    nameController = TextEditingController(
        text: myServices.sharedPreferences.getString("userName"));
    emailController = TextEditingController(
        text: myServices.sharedPreferences.getString("email"));
    mobileController = TextEditingController(
        text: myServices.sharedPreferences.getString("phoneNumber"));

    remarkController = TextEditingController();
    getAprove();

    super.onInit();
  }

  @override
  logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutsName.login);
  }

  void openMenuSide() {
    if (isOpenMenuSide == true) {
      isOpenMenuSide = false;
    } else {
      isOpenMenuSide = true;
    }
    update();
  }

  //
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SideMenuController extends GetxController {
  goToProfile();
  aboutApp();

  logOut();
}

class SideMenuControllerImp extends SideMenuController {
  @override
  goToProfile() {
    Get.toNamed(AppRoutsName.profilescreen);
  }

  @override
  aboutApp() {
    Get.toNamed(AppRoutsName.aboutUs);
  }

  @override
  logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutsName.login);
  }

  permissionStorage() async {
    PermissionStatus status = await Permission.manageExternalStorage.status;

    if (status == PermissionStatus.granted) {
      final directory = await getDownloadsDirectory();
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

      newPath = "$newPath/Download/myExcel";

      // افتح مجلد التنزيلات
      await OpenFile.open(newPath);
    } else {
      await Permission.manageExternalStorage.request();
    }
    update();
  }

  permissionStoragetow() async {
    PermissionStatus status = await Permission.storage.status;

    if (status == PermissionStatus.granted) {
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
      newPath = "$newPath/Download/myExcel";

      // افتح مجلد التنزيلات
      await OpenFile.open(newPath);
    } else {
      await Permission.storage.request();
    }
    update();
  }
}

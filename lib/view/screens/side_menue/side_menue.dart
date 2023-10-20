import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/controller/side_menu/side_menu_controller.dart';
import 'package:monitoringdata_excel/view/widget/side_menu/custom_listtiel_setting.dart';
import 'package:monitoringdata_excel/view/widget/side_menu/custom_listtile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/side_menu/custom_divider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    SideMenuControllerImp controller = Get.put(SideMenuControllerImp());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: 300,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomListTileSideMenu(
                ontap: () {
                  controller.goToProfile();
                },
                textTitel: "Profile",
              ),
              const SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  const CustomDivider(),
                  CustomListTileSetting(
                    ontap: () {
                      controller.permissionStorage();
                      controller.permissionStoragetow();
                    },
                    imagepath: "assets/riveAssets/file.riv",
                    textTitel: "My Files",
                  ),
                  const CustomDivider(),
                  CustomListTileSetting(
                    ontap: () {
                      controller.aboutApp();
                    },
                    imagepath: "assets/riveAssets/setting.riv",
                    textTitel: "About App",
                  ),
                  const CustomDivider(),
                  CustomListTileSetting(
                    ontap: () async {
                      await launchUrl(Uri.parse("tel:+96597266144"));
                    },
                    imagepath: "assets/riveAssets/call.riv",
                    textTitel: "call us",
                  ),
                  const CustomDivider(),
                  CustomListTileSetting(
                    ontap: () {
                      controller.logOut();
                    },
                    imagepath: "assets/riveAssets/exi.riv",
                    textTitel: "Log Out",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

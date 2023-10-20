import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/view/widget/about_us/customBackIcon.dart';
import 'package:monitoringdata_excel/view/widget/about_us/customtitle.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: ListView(children: [
              Row(children: [
                CustomBackIcon(onPressed: () {
                  Get.back();
                }),
                const CustomTitle(
                  texttitle: "About US",
                ),
                const Spacer(),
              ]),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.redcolor,
                    radius: 75,
                    child: RiveAnimation.asset(
                      "assets/riveAssets/setting.riv",
                    ),
                  ),
                  Text(
                    "Monitoring Data",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(
                    color: AppColors.oraColor,
                    endIndent: 50,
                    thickness: 3,
                    indent: 50,
                  ),
                ],
              ),
              // ListTile(
              //   title: Center(
              //     child: Text("who are we".tr,
              //         style: Theme.of(context)
              //             .textTheme
              //             .titleMedium!
              //             .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
              //   ),
              //   subtitle: Text("".tr,
              //       style: Theme.of(context)
              //           .textTheme
              //           .titleMedium!
              //           .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
              // ),
              // const Divider(
              //   color: AppColors.oraColor,
              //   endIndent: 50,
              //   thickness: 1,
              //   indent: 50,
              // ),
              ListTile(
                title: Center(
                  child: Text("The goal of the application",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("- Record data and convert it to an Excel file",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("- Download the file and save it in the mobile memory",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    // Text("gooalThree".tr,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .titleMedium!
                    //         .copyWith(
                    //             fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              ListTile(
                title: Center(
                  child: Text("Application features",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("- Enter an unlimited number of lines",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("- Speed ​​in exporting the file to Excel",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        "- The ability to store the file in the device's memory",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("- Ease of use",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              ListTile(
                title: Center(
                  child: Text("Contact the application team",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+96597266144"));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: AppColors.redcolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("contact_us",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.redcolor)),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColors.oraColor,
                endIndent: 50,
                thickness: 1,
                indent: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Center(
                  child: Text("Version",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: const SizedBox(
                  height: 20,
                  child: Text(
                    "V 0.1",
                    style: TextStyle(
                        color: AppColors.blackColor3,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}

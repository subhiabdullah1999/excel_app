import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:monitoringdata_excel/controller/profile/profilecontroller.dart";
import "package:monitoringdata_excel/core/constant/appColors.dart";
import "package:monitoringdata_excel/view/widget/about_us/customBackIcon.dart";
import "package:monitoringdata_excel/view/widget/about_us/customtitle.dart";
import "package:monitoringdata_excel/view/widget/auth/custom_texet_form_failed.dart";
import "package:monitoringdata_excel/view/widget/profile/custombuttonauth.dart";
import "package:monitoringdata_excel/view/widget/profile/customcontainerpssword.dart";
import "package:rive/rive.dart";

class ProfileScrren extends StatelessWidget {
  const ProfileScrren({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(
        builder: (controller) => Scaffold(
              body: Container(
                color: AppColors.whiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: ListView(
                  children: [
                    Row(children: [
                      CustomBackIcon(
                        onPressed: () {
                          controller.goBack();
                        },
                      ),
                      const CustomTitle(
                        texttitle: "Profile",
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      backgroundColor: AppColors.redcolor,
                      radius: 45,
                      child: RiveAnimation.asset(
                        "assets/riveAssets/person.riv",
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Form(
                        key: controller.formstate,
                        child: Column(
                          children: [
                            CustomTextFormSignIn(
                              controllertext: controller.userName,
                              labelTextform: "Full Name",
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty";
                                }
                                if (val!.length > 30) {
                                  return "Username cannot be greater than 30";
                                }
                                if (val.length < 2) {
                                  return "Username cannot be younger than 2";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormSignIn(
                              controllertext: controller.phonenumber,
                              labelTextform: "Mobile Number",
                              validator: (val) {
                                if (val == "") {
                                  return "This field cannot be empty";
                                }
                                if (val!.length < 2) {
                                  return " Mobile Number cannot be younger than 2";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormSignIn(
                              controllertext: controller.emaile,
                              labelTextform: "email",
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains(".") ||
                                    !value.contains("@")) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                            ),
                            CustomContainerPassword(
                              textbutton: "Change",
                              ontap: () {
                                controller.goToChanePassord();
                              },
                              texttitle: "PAssword",
                              textcontant: "************",
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomButtonAuthWidget(
                                color: AppColors.oraColor,
                                widthleft: 20,
                                widthright: 20,
                                textButt: "Change settings",
                                onPressed: () {
                                  controller.iconEditeProfile();
                                }),
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}

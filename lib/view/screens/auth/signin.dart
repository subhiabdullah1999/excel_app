// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/controller/auth/signin_controller.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_button_regester.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_circelavatar.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_login_text.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_texet_form_failed.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_text_sign_or_login.dart';
import 'package:monitoringdata_excel/view/widget/divider/devider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<SignInControllerImp>(
      builder: (controller) => ListView(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 30),
                    child: CustomCircelAvatar(),
                  ),
                  const CustomTextSignAndLogIn(
                    textTitel: "Sign Up",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: controller.keyformstate,
                    child: Column(
                      children: [
                        CustomTextFormSignIn(
                          controllertext: controller.userName,
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
                          hintTextform: "User Name",
                          keboardType: TextInputType.multiline,
                          labelTextform: "User Name",
                          iconform: Icons.person_3_sharp,
                        ),
                        CustomTextFormSignIn(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains(".") ||
                                !value.contains("@")) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          controllertext: controller.email,
                          hintTextform: "Email",
                          keboardType: TextInputType.emailAddress,
                          labelTextform: "Email",
                          iconform: Icons.email,
                        ),
                        CustomTextFormSignIn(
                          validator: (val) {
                            if (val == "") {
                              return "This field cannot be empty";
                            }
                            if (val!.length < 2) {
                              return " Mobile Number cannot be younger than 2";
                            }
                            return null;
                          },
                          controllertext: controller.phoneNumber,
                          hintTextform: "mobile Number",
                          keboardType: TextInputType.phone,
                          labelTextform: "mobile Number",
                          iconform: Icons.phone,
                        ),
                        CustomTextFormSignIn(
                          validator: (val) {
                            if (val == "") {
                              return "This field cannot be empty";
                            }
                            if (val!.length < 6) {
                              return "Password cannot be younger than 6";
                            }
                            if (controller.pass != controller.conPass) {
                              return "The two passwords do not match";
                            }
                            return null;
                          },
                          onsaved: (val) {
                            controller.pass = val;
                          },
                          controllertext: controller.password,
                          hintTextform: "Password",
                          keboardType: TextInputType.multiline,
                          labelTextform: "Password",
                          iconform: Icons.lock_outlined,
                          colorIcon: controller.isShowPass == false
                              ? AppColors.redcolor
                              : AppColors.blackColor,
                          iconprefix: controller.isShowPass == false
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          onpressedIcon: () {
                            controller.showPassWoord();
                          },
                          showpass: controller.isShowPass,
                        ),
                        CustomTextFormSignIn(
                          validator: (val) {
                            if (val == "") {
                              return "This field cannot be empty";
                            }
                            if (val!.length < 6) {
                              return "Password cannot be younger than 6";
                            }
                            if (controller.pass != controller.conPass) {
                              return "The two passwords do not match";
                            }
                            return null;
                          },
                          onsaved: (val) {
                            controller.conPass = val;
                          },
                          controllertext: controller.confirmPassword,
                          hintTextform: "Confirm Password",
                          keboardType: TextInputType.multiline,
                          labelTextform: "Confirm Password",
                          iconform: Icons.lock_outlined,
                          colorIcon: controller.isShowPass == false
                              ? AppColors.redcolor
                              : AppColors.blackColor,
                          iconprefix: controller.isShowPass == false
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          onpressedIcon: () {
                            controller.showPassWoord();
                          },
                          showpass: controller.isShowPass,
                        ),
                      ],
                    ),
                  ),
                  CustomButtonRegester(
                    ontap: () {
                      controller.signInWitheFirebase();
                    },
                    textButton: "Sign Up",
                  ),
                  Row(
                    children: [
                      CustomTextSignAndLogIn(
                          textTitel: "You already have an account ?"),
                      CustomLoginText(
                        onTap: () {
                          controller.goToLogin();
                        },
                        textlab: "LogIn",
                      )
                    ],
                  ),
                  CustomDivider()
                ],
              )),
        ],
      ),
    )));
  }
}

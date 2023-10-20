import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/controller/auth/login_controller.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/functions/alertdialogexitapp.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_button_regester.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_circelavatar.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_login_text.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_texet_form_failed.dart';
import 'package:monitoringdata_excel/view/widget/auth/custom_text_sign_or_login.dart';
import 'package:monitoringdata_excel/view/widget/divider/devider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return SafeArea(
        child: Scaffold(
            body: WillPopScope(
      onWillPop: alertDialogExitApp,
      child: GetBuilder<LogInControllerImp>(
        builder: (controller) => ListView(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 30),
                      child: CustomCircelAvatar(),
                    ),
                    const CustomTextSignAndLogIn(
                      textTitel: "Sign In",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: controller.keyFormstate,
                      child: Column(
                        children: [
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
                              if (val!.length < 6) {
                                return "Password cannot be younger than 6";
                              }
                              return null;
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
                          Row(
                            children: [
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  controller.forgetPassword();
                                },
                                child: const CustomTextSignAndLogIn(
                                    textTitel: "Forget Password ?"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButtonRegester(
                      ontap: () {
                        controller.logInWithFairebase();
                      },
                      textButton: "Sign In",
                    ),
                    Row(
                      children: [
                        const CustomTextSignAndLogIn(
                            textTitel: "You don't have an account ?"),
                        CustomLoginText(
                          onTap: () {
                            controller.goToSignUp();
                          },
                          textlab: "SignUp",
                        )
                      ],
                    ),
                    const CustomDivider()
                  ],
                )),
          ],
        ),
      ),
    )));
  }
}

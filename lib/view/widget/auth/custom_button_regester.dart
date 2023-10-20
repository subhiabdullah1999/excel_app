// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomButtonRegester extends StatelessWidget {
  final void Function()? ontap;
  final String textButton;

  const CustomButtonRegester({super.key, this.ontap, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: InkWell(
        onTap: ontap,
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          height: 45,
          // width: Get.width - 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.oraColor),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}

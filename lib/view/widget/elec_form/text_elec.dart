import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomTextElec extends StatelessWidget {
  final String textElec;
  const CustomTextElec({super.key, required this.textElec});

  @override
  Widget build(BuildContext context) {
    return Text(
      textElec,
      style: const TextStyle(
          color: AppColors.blackColors,
          fontSize: 20,
          fontWeight: FontWeight.w400),
    );
  }
}

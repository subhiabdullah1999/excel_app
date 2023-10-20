import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomTextSignAndLogIn extends StatelessWidget {
  final String textTitel;
  const CustomTextSignAndLogIn({super.key, required this.textTitel});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitel,
      style: const TextStyle(
          color: AppColors.blackColor3,
          fontWeight: FontWeight.w600,
          fontSize: 20),
    );
  }
}

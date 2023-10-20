import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomLoginText extends StatelessWidget {
  final String textlab;
  final void Function()? onTap;
  const CustomLoginText({super.key, required this.textlab, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        textlab,
        style: const TextStyle(
            color: AppColors.oraColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomCircelAvatar extends StatelessWidget {
  const CustomCircelAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: AppColors.oraColor,
      radius: 50,
      backgroundImage: AssetImage(
        "assets/images/splashexcel.png",
      ),
    );
  }
}

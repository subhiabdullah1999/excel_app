import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:monitoringdata_excel/core/constant/appimage.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.loading, height: 125, width: 125),
    );
  }
}

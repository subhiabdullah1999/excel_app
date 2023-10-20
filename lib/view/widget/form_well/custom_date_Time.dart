// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/controller/home/home_controller.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomDateTime extends StatelessWidget {
  final String? textDate;
  final void Function()? onTap;
  const CustomDateTime({super.key, this.textDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.blackColors7, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<HomeControllerImp>(
                builder: (controller) => Text(textDate!)),
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: AppColors.blackColors5,
            )
          ],
        ),
      ),
    );
  }
}

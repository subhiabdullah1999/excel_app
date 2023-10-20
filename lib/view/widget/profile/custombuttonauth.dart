import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomButtonAuthWidget extends StatelessWidget {
  final String textButt;
  final void Function()? onPressed;
  final double widthleft;
  final double widthright;

  final Color color;

  const CustomButtonAuthWidget(
      {super.key,
      required this.textButt,
      required this.onPressed,
      required this.widthleft,
      required this.color,
      required this.widthright});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      padding: EdgeInsets.only(left: widthleft, right: widthright),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
          child: Center(
            child: Text(
              textButt.tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20, color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:rive/rive.dart';

class CustomListTileSetting extends StatelessWidget {
  final String imagepath;
  final String textTitel;

  final void Function()? ontap;
  const CustomListTileSetting(
      {super.key,
      required this.imagepath,
      this.ontap,
      required this.textTitel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: SizedBox(
          height: 35,
          width: 35,
          child: RiveAnimation.asset(
            imagepath,

            // artboard: "USER",
            // onInit: (artboard) {},
          ),
        ),
        title: Text(
          textTitel,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

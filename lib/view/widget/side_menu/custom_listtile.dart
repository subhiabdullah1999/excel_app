import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomListTileSideMenu extends StatelessWidget {
  final String? textTitel;
  final void Function()? ontap;
  const CustomListTileSideMenu({super.key, this.textTitel, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(
            CupertinoIcons.person_alt,
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          textTitel!,
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
      ),
    );
  }
}

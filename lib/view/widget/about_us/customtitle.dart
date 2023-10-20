import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomTitle extends StatelessWidget {
  final String texttitle;
  const CustomTitle({super.key, required this.texttitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 10,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            texttitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.blackColor3,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}

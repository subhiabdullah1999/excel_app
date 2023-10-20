import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

import '../divider/devider.dart';

class CustomContainerPassword extends StatelessWidget {
  final String texttitle;
  final String textcontant;
  final String textbutton;
  final void Function()? ontap;

  const CustomContainerPassword(
      {super.key,
      required this.texttitle,
      required this.textcontant,
      required this.textbutton,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texttitle.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColors7,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(children: [
            Expanded(
              child: Text(
                textcontant.tr,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.blackColor3,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // TextButton(
            //   onPressed: ontap,
            //   child: Text(
            //     textbutton.tr,
            //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //         color: AppColors.oraColor,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w500),
            //   ),
            // )
          ]),
          const SizedBox(
            height: 15,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomTextFormChangePass extends StatelessWidget {
  final IconData? iconData;
  final IconData? suffixicon;
  final Widget? label;
  final String? inivalue;
  final TextEditingController? mycontroller;

  final TextInputType? keyboardType;

  final String? Function(String?)? valid;
  final void Function()? ontapIcon;

  final bool? obsc;

  const CustomTextFormChangePass(
      {super.key,
      this.iconData,
      this.keyboardType,
      required this.valid,
      this.obsc,
      this.ontapIcon,
      this.suffixicon,
      required this.label,
      this.inivalue,
      this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      initialValue: inivalue,
      cursorColor: AppColors.oraColor,
      obscureText: obsc == null || obsc == false ? false : true,
      validator: valid,
      keyboardType: keyboardType,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        label: label,
        suffixIcon: InkWell(
          onTap: ontapIcon,
          child: Icon(suffixicon),
        ),
        suffixIconColor: obsc == false ? AppColors.redcolor : AppColors.gry2,
        prefixIcon: InkWell(
          child: Icon(
            iconData,
          ),
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
      ),
    );
  }
}

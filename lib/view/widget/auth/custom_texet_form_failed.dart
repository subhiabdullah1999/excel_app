import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

class CustomTextFormSignIn extends StatelessWidget {
  final TextInputType? keboardType;
  final String? hintTextform;
  final String? labelTextform;
  final IconData? iconform;
  final IconData? iconprefix;
  final TextEditingController? controllertext;
  final Color? colorIcon;
  final bool? showpass;
  final String? Function(String?)? validator;
  final void Function(String?)? onsaved;

  final void Function()? onpressedIcon;

  const CustomTextFormSignIn(
      {super.key,
      this.keboardType,
      this.hintTextform,
      required this.controllertext,
      required this.labelTextform,
      this.iconform,
      this.iconprefix,
      this.colorIcon,
      this.onpressedIcon,
      this.showpass = false,
      this.validator,
      this.onsaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onChanged: onsaved,
        validator: validator,
        controller: controllertext,
        keyboardType: keboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), gapPadding: 2),
          hintText: hintTextform,
          hintTextDirection: TextDirection.ltr,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(labelTextform!)),
          prefix: InkWell(
            onTap: onpressedIcon,
            child: Icon(
              iconprefix,
              color: colorIcon,
            ),
          ),
          suffix: Icon(
            iconform,
            color: AppColors.blackColor3,
          ),
        ),
        obscureText: showpass!,
      ),
    );
  }
}

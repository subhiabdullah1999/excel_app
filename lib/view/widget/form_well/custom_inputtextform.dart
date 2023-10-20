import 'package:flutter/material.dart';

class CustomTextFormFiles extends StatelessWidget {
  final TextInputType? keboardType;
  final String? hintTextform;
  final String? initValue;

  final TextEditingController? controllertext;

  const CustomTextFormFiles(
      {super.key,
      this.keboardType,
      this.hintTextform,
      required this.controllertext,
      this.initValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        initialValue: initValue,
        controller: controllertext,
        keyboardType: keboardType,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          border: const OutlineInputBorder(),
          hintText: hintTextform,
          hintTextDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

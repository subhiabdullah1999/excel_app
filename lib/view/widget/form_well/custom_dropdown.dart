// import 'package:com.view.monitoringdata_excel/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomDropDown extends StatelessWidget {
//   const CustomDropDown({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HomeControllerImp controller = Get.put(HomeControllerImp());
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.grey, width: 1)),
//       child: DropdownButton(
//           iconSize: 30,
//           isExpanded: true,
//           value: controller.choStatuse,
//           items: controller.liststatus.map((valueItem) {
//             return DropdownMenuItem(
//                 value: valueItem,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text(valueItem),
//                 ));
//           }).toList(),
//           onChanged: (newVal) {
//             controller.choStatuse = newVal!;
//             controller.changeChosStatus();
//           }),
//     );
//   }
// }

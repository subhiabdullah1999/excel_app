// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoringdata_excel/controller/home/home_controller.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';
import 'package:monitoringdata_excel/core/functions/alertdialogexitapp.dart';
import 'package:monitoringdata_excel/view/screens/side_menue/side_menue.dart';
import 'package:monitoringdata_excel/view/widget/elec_form/text_elec.dart';
import 'package:monitoringdata_excel/view/widget/form_well/custom_date_Time.dart';
import 'package:monitoringdata_excel/view/widget/form_well/custom_inputtextform.dart';
import 'package:rive/rive.dart' as rive;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    controller.dateTime =
        "${controller.dateyear} - ${controller.dateMonth} - ${controller.dateday}";

    void showDate() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(3000))
          .then((value) {
        controller.dateTime = "${value!.year} - ${value.month} - ${value.day}";
        controller.changeChosStatus();
      });
    }

    return SafeArea(
        child: WillPopScope(
      onWillPop: alertDialogExitApp,
      child: GetBuilder<HomeControllerImp>(
          builder: (controller) => Scaffold(
              backgroundColor: const Color(0xFF17203A),
              body: Stack(
                children: [
                  Positioned(width: 300, height: Get.height, child: SideMenu()),
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(1 - 57 * pi / 180),
                    child: Transform.translate(
                      offset: controller.isOpenMenuSide == true
                          ? Offset(300, 0)
                          : Offset(0, 0),
                      child: Transform.scale(
                        scale: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 49, 43, 43),
                                  Color.fromARGB(255, 117, 114, 114),
                                  Color.fromARGB(255, 131, 61, 61),
                                  Color.fromARGB(255, 158, 38, 38)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.white70, width: 7)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 1),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      child: controller.isOpenMenuSide == false
                                          ? MenuButton(
                                              inagePath:
                                                  "assets/riveAssets/menu.riv",
                                              onpress: () {
                                                controller.openMenuSide();
                                              },
                                            )
                                          : MenuButtontow(
                                              inagePath:
                                                  "assets/riveAssets/men.riv",
                                              onpress: () {
                                                controller.openMenuSide();
                                              })),
                                  const SizedBox(
                                    height: 70,
                                    child: Center(
                                      child: Text(
                                        "Fill In These Forms",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          controller.logOut();
                                        },
                                        icon: Icon(
                                          Icons.logout,
                                          color: AppColors.whiteColor,
                                          size: 30,
                                        )),
                                  ),
                                ],
                              ),
                              Accordion(
                                headerBorderColor: Colors.blueGrey,
                                headerBorderColorOpened: Colors.transparent,
                                disableScrolling: true,
                                headerBackgroundColorOpened: Colors.green,
                                contentBackgroundColor: Colors.white,
                                contentBorderColor: Colors.green,
                                contentBorderWidth: 3,
                                contentHorizontalPadding: 20,
                                scaleWhenAnimating: true,
                                openAndCloseAnimation: true,
                                paddingBetweenClosedSections: 20,
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                sectionOpeningHapticFeedback:
                                    SectionHapticFeedback.heavy,
                                sectionClosingHapticFeedback:
                                    SectionHapticFeedback.light,
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    contentVerticalPadding: 20,
                                    leftIcon: const Icon(
                                        Icons.text_fields_rounded,
                                        color: Colors.white),
                                    header: const Text('well',
                                        style: AppColors.headerStyle),
                                    content: Form(
                                        child: Column(
                                      children: [
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.wellNoController,
                                          hintTextform: "Well No",
                                          keboardType: TextInputType.multiline,
                                        ),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Status",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 30,
                                                          isExpanded: true,
                                                          value: controller
                                                              .choStatuse,
                                                          items: controller
                                                              .liststatus
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .choStatuse =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.timeWellNoController,
                                          hintTextform: "Time",
                                          keboardType: TextInputType.multiline,
                                        ),
                                        CustomDateTime(
                                          textDate: controller.dateTime,
                                          onTap: showDate,
                                        ),
                                      ],
                                    )),
                                  ),
                                  AccordionSection(
                                    isOpen: false,
                                    leftIcon: const Icon(Icons.input,
                                        color: Colors.white),
                                    header: const Text('Electrical data',
                                        style: AppColors.headerStyle),
                                    contentHorizontalPadding: 10,
                                    contentVerticalPadding: 20,
                                    content: Form(
                                        child: Column(
                                      children: [
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.frequancyController,
                                          hintTextform: "Frequancy",
                                          keboardType: TextInputType.number,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomTextElec(
                                                      textElec: "Asmp A*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .asampAController,
                                                      hintTextform: "A",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomTextElec(
                                                      textElec: "B*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .asampBController,
                                                      hintTextform: "B",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomTextElec(
                                                      textElec: "C*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .asampCController,
                                                      hintTextform: "C",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomTextElec(
                                                      textElec: "Volt AB*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .valtAController,
                                                      hintTextform: "AB",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const CustomTextElec(
                                                      textElec: "BC*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .valtBController,
                                                      hintTextform: "BC",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextElec(
                                                      textElec: "AC*",
                                                    ),
                                                    CustomTextFormFiles(
                                                      controllertext: controller
                                                          .valtCController,
                                                      hintTextform: "AC",
                                                      keboardType: TextInputType
                                                          .datetime,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                  ),
                                  AccordionSection(
                                    isOpen: false,
                                    leftIcon: const Icon(
                                        Icons.child_care_rounded,
                                        color: Colors.white),
                                    header: const Text('Surface data',
                                        style: AppColors.headerStyle),
                                    content: Form(
                                        child: Column(
                                      children: [
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.wHPController,
                                          hintTextform: "WHP",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.fLPController,
                                          hintTextform: "FLP",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.fuelController,
                                          hintTextform: "Fuel %",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.tancCapcityController,
                                          hintTextform: "Tank capacity",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.panelOwnerController,
                                          hintTextform: "Panel Owner/type",
                                          keboardType: TextInputType.multiline,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext: controller
                                              .leftChockSizeController,
                                          hintTextform: "Left chock size",
                                          keboardType: TextInputType.number,
                                        ),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Left chock type",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          value: controller
                                                              .choSurfaceone,
                                                          items: controller
                                                              .listSurfaceone
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .choSurfaceone =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Left chock status",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          value: controller
                                                              .chosLeftChockStatuse,
                                                          items: controller
                                                              .listLeftChockStatuse
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .chosLeftChockStatuse =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                        CustomTextFormFiles(
                                          controllertext: controller
                                              .rightChockSizeController,
                                          hintTextform: "Right chock size",
                                          keboardType: TextInputType.number,
                                        ),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Right chock type",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          value: controller
                                                              .chosRightChockType,
                                                          items: controller
                                                              .listRightChockType
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .chosRightChockType =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Right chock status",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          value: controller
                                                              .chosRightChockStatus,
                                                          items: controller
                                                              .listRightChockStatus
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .chosRightChockStatus =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                        GetBuilder<HomeControllerImp>(
                                            builder: (controller) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15),
                                                  child:
                                                      DropdownButtonFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15),
                                                            label: Text(
                                                              "Location status",
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        22),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          value: controller
                                                              .chosLocationStatus,
                                                          items: controller
                                                              .listLocationStatus
                                                              .map((valueItem) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueItem,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Text(
                                                                      valueItem),
                                                                ));
                                                          }).toList(),
                                                          onChanged: (newVal) {
                                                            controller
                                                                    .chosLocationStatus =
                                                                newVal!;
                                                            // controller
                                                            // .changeChosStatus();
                                                          }),
                                                )),
                                      ],
                                    )),
                                  ),
                                  AccordionSection(
                                    isOpen: false,
                                    leftIcon: const Icon(Icons.shopping_cart,
                                        color: Colors.white),
                                    header: const Text('Downhole data',
                                        style: AppColors.headerStyle),
                                    content: Form(
                                        child: Column(
                                      children: [
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.piController,
                                          hintTextform: "Pi",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.pdController,
                                          hintTextform: "Pd",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.tiController,
                                          hintTextform: "Ti",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.tmController,
                                          hintTextform: "Tm",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.vxController,
                                          hintTextform: "Vx",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.vyController,
                                          hintTextform: "Vy",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.ciaController,
                                          hintTextform: "CIA",
                                          keboardType: TextInputType.number,
                                        ),
                                        CustomTextFormFiles(
                                          controllertext:
                                              controller.cipController,
                                          hintTextform: "CIP",
                                          keboardType: TextInputType.number,
                                        ),
                                      ],
                                    )),
                                  ),
                                  AccordionSection(
                                    isOpen: false,
                                    leftIcon: const Icon(Icons.person_3,
                                        color: Colors.white),
                                    header: const Text('Contact data',
                                        style: AppColors.headerStyle),
                                    contentHorizontalPadding: 10,
                                    contentVerticalPadding: 20,
                                    content: Form(
                                        child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomTextElec(
                                              textElec: "*Person",
                                            ),
                                            CustomTextFormFiles(
                                              controllertext:
                                                  controller.nameController,
                                              hintTextform: "Name",
                                              keboardType:
                                                  TextInputType.multiline,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomTextElec(
                                              textElec: "*Email",
                                            ),
                                            CustomTextFormFiles(
                                              controllertext:
                                                  controller.emailController,
                                              hintTextform: "Email",
                                              keboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomTextElec(
                                              textElec: "*Mobile No",
                                            ),
                                            CustomTextFormFiles(
                                              controllertext:
                                                  controller.mobileController,
                                              // hintTextform: "(9XXXXXX)",
                                              keboardType: TextInputType.phone,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                  ),
                                  AccordionSection(
                                    isOpen: false,
                                    leftIcon: const Icon(Icons.circle,
                                        color: Colors.white),
                                    headerBorderRadius: 30,
                                    headerBackgroundColor: Colors.blue,
                                    headerBackgroundColorOpened: Colors.green,
                                    headerBorderColorOpened: Colors.blue,
                                    headerBorderWidth: 2,
                                    contentBackgroundColor: Colors.white,
                                    contentBorderColor: Colors.blue,
                                    contentBorderWidth: 2,
                                    contentBorderRadius: 100,
                                    contentVerticalPadding: 30,
                                    header: const Text('Remarks',
                                        style: AppColors.headerStyle),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomTextElec(
                                                textElec: "Remark *",
                                              ),
                                              CustomTextFormFiles(
                                                controllertext:
                                                    controller.remarkController,
                                                keboardType:
                                                    TextInputType.multiline,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Colors.greenAccent,
                                                width: 2)),
                                        height: 60,
                                        minWidth: 20,
                                        color: const Color.fromARGB(
                                            255, 49, 60, 77),
                                        onPressed: () {
                                          controller.addData();
                                        },
                                        child: Center(
                                          child: Column(
                                            children: const [
                                              Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 20),
                                              ),
                                              Icon(Icons.save_as_outlined)
                                            ],
                                          ),
                                        )),
                                    MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Colors.greenAccent,
                                                width: 2)),
                                        height: 60,
                                        minWidth: 20,
                                        color: const Color.fromARGB(
                                            255, 49, 60, 77),
                                        onPressed: () {
                                          controller.clearRows();
                                        },
                                        child: Center(
                                          child: Column(
                                            children: const [
                                              Text(
                                                "Well",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                ">>",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.greenAccent,
                                            width: 2)),
                                    height: 50,
                                    minWidth: 20,
                                    color: Colors.white,
                                    onPressed: () {
                                      controller.exportData();
                                      // controller.permissionStoragetow();
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Generate Exsel File",
                                        style: TextStyle(
                                            color: AppColors.blackColor2,
                                            fontSize: 20),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    ));
  }
}

class MenuButton extends StatelessWidget {
  final VoidCallback onpress;
  final String inagePath;

  const MenuButton({
    super.key,
    required this.onpress,
    required this.inagePath,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => GestureDetector(
              onTap: onpress,
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: rive.RiveAnimation.asset(
                  inagePath,
                ),
              ),
            ));
  }
}

class MenuButtontow extends StatelessWidget {
  final VoidCallback onpress;
  final String inagePath;

  const MenuButtontow({
    super.key,
    required this.onpress,
    required this.inagePath,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => GestureDetector(
              onTap: onpress,
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: rive.RiveAnimation.asset(
                  inagePath,
                ),
              ),
            ));
  }
}

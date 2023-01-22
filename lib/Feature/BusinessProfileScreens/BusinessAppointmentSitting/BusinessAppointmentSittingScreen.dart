// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessCustomerFeedBack/BusinessCustomerFeedBack.dart';

import '../../CustomerProflieScreens/ShopDetailScreen.dart/Shopdetaildata.dart';

class BusinessAppointmentSitting extends StatefulWidget {
  BusinessAppointmentSitting({Key? key}) : super(key: key);

  @override
  State<BusinessAppointmentSitting> createState() =>
      _BusinessAppointmentSittingState();
}

class _BusinessAppointmentSittingState
    extends State<BusinessAppointmentSitting> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = true;
  bool isChecked4 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: lightgrey,
            body: Screenlayout_widget(
                state: 2,
                height: 90.h,
                // paddingstate: 2,
                screendata: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        images.calendar_large,
                        scale: 4,
                        // scale: 2,
                      ),
                    ),
                    Text_widget(
                      name: "Auto Confirmation",
                      text_size: 16,
                    ),
                    custom_Card(
                        data: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // fillColor: baseColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
                              return baseColor;
                            }
                            return baseColor;
                          }),
                          value: isChecked,
                          shape: const CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text_widget(
                          name: "Auto Confirm Appointments",
                          text_size: 15,
                        ),
                      ],
                    )),
                    Text_widget(
                      name: "Auto Confirmation",
                      text_size: 16,
                    ),
                    custom_Card(
                        data: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // fillColor: baseColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
                              return baseColor;
                            }
                            return baseColor;
                          }),
                          value: isChecked2,
                          shape: const CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value!;
                            });
                          },
                        ),
                        Text_widget(
                          name: "Let's user chose multiple services",
                          text_size: 15,
                        ),
                      ],
                    )),
                    Text_widget(
                      name: "Let's get paid by",
                      text_size: 16,
                    ),
                    custom_Card(
                        data: Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // fillColor: baseColor,
                              fillColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return baseColor;
                                }
                                return baseColor;
                              }),
                              value: isChecked3,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked3 = value!;
                                });
                              },
                            ),
                            Text_widget(
                              name: "Pay Online",
                              text_size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // fillColor: baseColor,
                              fillColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return baseColor;
                                }
                                return baseColor;
                              }),
                              value: isChecked4,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4 = value!;
                                });
                              },
                            ),
                            Text_widget(
                              name: "Pay In Shop",
                              text_size: 18,
                            ),
                          ],
                        ),
                      ],
                    )),
                    fixsize,
                    Custom_button(
                        text: "Save",
                        onpressed: () {
                          Get.to(BusinessCustomerFeedBack());
                        }),
                  ],
                )),
                appbarData: appbar_one(
                  Screenname: "Appointment Settings",
                ))));
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'BusinessNewEvent.dart';
import 'EventAttendees.dart';

class EventPostSuccessfullyScreen extends StatelessWidget {
  EventPostSuccessfullyScreen({Key? key}) : super(key: key);

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
                  children: [
                    Center(
                        child: Lottie.asset(images.animation,
                            height: 250.h, width: 280.w)),
                    fixsize,
                    fixsize,
                    fixsize,
                    fixsize,
                    Text_widget(
                      name: "Your event has been successfully posted",
                      text_size: 18,
                    ),
                    fixsize,
                    Custom_button(
                        text: "DONE",
                        onpressed: () {
                          Get.to(const EventAttendeesScreen());
                        }),
                  ],
                )),
                appbarData: appbar_one(
                  Screenname: "Event Creation Subscription",
                ))));
  }
}

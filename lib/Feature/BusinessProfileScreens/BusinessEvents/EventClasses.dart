// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';

import 'BusinessNewEvent.dart';
import 'EventCreationSubscription.dart';

class EventClasses extends StatelessWidget {
  EventClasses({Key? key}) : super(key: key);

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      fixsize,
                      SizedBox(
                        width: 290.w,
                        child: Text_widget(
                            name:
                                "Do you want to set event for different classes of people?",
                            text_size: 13),
                      ),
                      fixsize,
                      Image.asset(
                        images.eventclass,
                        scale: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 10),
                        child: Column(
                          children: [
                            customTextfeild(name: "General Entry"),
                            fixsize,
                            customTextfeild(name: "Premium Entry"),
                            fixsize,
                            customTextfeild(name: "VIP Entry"),
                            fixsize,
                          ],
                        ),
                      ),
                      Custom_button(
                          text: "POST EVENT",
                          onpressed: () {
                            Get.to(EventCreationSubscription());
                          }),
                      fixsize,
                      SizedBox(
                        width: 280.w,
                        child: Text_widget(
                            name:
                                "Leave the other classes entry empty if you want to offer it as general",
                            text_size: 12),
                      ),
                    ],
                  ),
                ),
                appbarData: appbar_one(
                  Screenname: "Event attending Classes",
                ))));
  }
}

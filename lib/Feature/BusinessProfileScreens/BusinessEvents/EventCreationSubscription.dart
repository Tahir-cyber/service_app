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
import 'package:service_app/Feature/BusinessProfileScreens/BusinessEvents/EventPostSuccessfully.dart';

import 'BusinessNewEvent.dart';

class EventCreationSubscription extends StatelessWidget {
  EventCreationSubscription({Key? key}) : super(key: key);

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
                    Text_widget(
                      name: "Enter Bank details",
                      text_size: 22,
                    ),
                    Text_widget(
                      name: "Get Paid by customers",
                      text_size: 17,
                    ),
                    fixsize,
                    Image.asset(
                      images.card,
                      scale: 3.5,
                    ),
                    fixsize,
                    customTextfeild(name: "Card number"),
                    fixsize,
                    customTextfeild(name: "Card Holder's Name"),
                    fixsize,
                    Row(
                      children: [
                        Expanded(
                          child: customTextfeild(
                            name: "Exp. Date",
                          ),
                        ),
                        fixsizewidth10,
                        Expanded(
                          child: customTextfeild(
                            name: "CVV",
                          ),
                        ),
                      ],
                    ),
                    fixsize,
                    fixsize,
                    Custom_button(
                        text: "CONFORM PAYMENT",
                        onpressed: () {
                          Get.to(EventPostSuccessfullyScreen());
                        }),
                  ],
                )),
                appbarData: appbar_one(
                  Screenname: "Event Creation Subscription",
                ))));
  }
}

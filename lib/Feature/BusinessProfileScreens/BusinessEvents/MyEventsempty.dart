// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessCustomerFeedBack/BusinessCustomerFeedBack.dart';
import 'package:service_app/Feature/ServiceScreen/ServiceScreen.dart';

import '../SelectDutyDaysScreen/SelectDutyDaysScreen.dart';
import 'MyEventsScreen.dart';

class MyBusinessEventEmpty extends StatelessWidget {
  MyBusinessEventEmpty({Key? key}) : super(key: key);

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
                    Image.asset(
                      images.myevent,
                      scale: 2,
                    ),
                    fixsize,
                    Text_widget(
                      name: "No event has been created",
                      text_size: 19,
                    ),
                    fixsize,
                    fixsize,
                    fixsize,
                    fixsize,
                    Custom_button(
                      text: "Next Events",
                      onpressed: () {
                        Get.to(MyBusinessEvent());
                      },
                      state: 2,
                      data: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 20.sp,
                            color: baseColor,
                          ),
                          fixsizewidth10,
                          Text_widget(
                              name: "Create Event",
                              state: 2,
                              text_size: 18,
                              Text_color: baseColor),
                        ],
                      ),
                    ),
                  ],
                )),
                appbarData: appbar_one(
                  Screenname: "My Events",
                ))));
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessAddServiceScreen/BusinessAddServiceScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/CustomerDetailsScreen/CustomerDetailScreen.dart';

import '../../../Core/classesInstance.dart';
import '../../../Core/common_widgets.dart';

class BusinessBoostService extends StatelessWidget {
  const BusinessBoostService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Screenlayout_widget(
            state: 2,
            height: 119,
            paddingstate: 2,
            screendata: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Lottie.asset(images.animation2,
                          height: 280.h, width: 280.w),
                      SizedBox(
                        width: 280,
                        child: Text_widget(
                            text_size: 16,
                            name:
                                "Now it's time to boost your business services and getmore clients and more appointments. Your services will be displayed as ads to user based on their interest"),
                      ),
                      customTextfeild(name: "Targeted Audience Location"),
                      fixsize10,
                      customTextfeild(name: "Service Ad Title"),
                      fixsize10,
                      customTextfeild(name: "Discounts (Optional)"),
                      fixsize10,
                      Custom_button(
                          text: "PUBLISH AD (\$10)", onpressed: () {}),
                    ],
                  ),
                )),
            appbarData: appbar_one(
              Screenname: "BOOST SERVICES",
            )));
  }
}

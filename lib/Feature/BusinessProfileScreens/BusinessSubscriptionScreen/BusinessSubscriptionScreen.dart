// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';

import '../BusinessBottomNvigation/BusinessBottomNvigation.dart';
import '../BusinessProfileCompletScreen/BusinessProfileCompletScreen.dart';

class BusinessSubscriptionScreen extends StatefulWidget {
  BusinessSubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<BusinessSubscriptionScreen> createState() =>
      _BusinessSubscriptionScreenState();
}

class _BusinessSubscriptionScreenState
    extends State<BusinessSubscriptionScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: SingleChildScrollView(
            child: commonPadding(
                data: Column(
          children: [
            Center(
              child: Text_widget(
                name: "Subscriptions",
                text_size: 22,
              ),
            ),
            SizedBox(
              width: 250.w,
              child: Text_widget(
                name:
                    "Select package plan to continue, and publish your services",
                text_size: 16,
              ),
            ),
            fixsize,
            Lottie.asset(images.animation2, height: 200.h, width: 280.w),
            InkWell(
              onTap: () {
                Get.offAll(BusinessBottomNavigations());
              },
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images.yellow_container),
                      fit: BoxFit.fill),
                ),
                child: commonPadding(
                  data: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text_widget(
                        name: "Monthly",
                        text_size: 23,
                      ),
                      Row(
                        children: [
                          Text_widget(
                            name: "\$150 ",
                            text_size: 17,
                          ),
                          minmium,
                          Text_widget(
                            state: 2,
                            Text_color: lightgrey4,
                            name: "/ Month",
                            text_size: 17,
                          ),
                        ],
                      ),
                      // fixsize10,
                      Text_widget(
                        state: 2,
                        name:
                            "10 Services/Products (Lorem ipsum dolor sit amet)",
                        text_size: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fixsize,
            InkWell(
              onTap: () {
                Get.offAll(BusinessBottomNavigations());
              },
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images.green_container),
                      fit: BoxFit.fill),
                ),
                child: commonPadding(
                  data: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text_widget(
                            name: "Annually",
                            text_size: 23,
                            state: 2,
                            Text_color: white,
                          ),
                          Text_widget(
                            name: "\$1,704",
                            text_size: 23,
                            state: 2,
                            Text_color: white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text_widget(
                            name: "\$142",
                            text_size: 17,
                            state: 2,
                            Text_color: white,
                          ),
                          minmium,
                          Text_widget(
                            state: 2,
                            Text_color: lightgrey3,
                            name: " / Month",
                            text_size: 17,
                          ),
                        ],
                      ),
                      // fixsize10,
                      Text_widget(
                        state: 2,
                        Text_color: white,
                        name:
                            "15 Services/Products (Lorem ipsum dolor sit amet)",
                        text_size: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fixsize,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: baseColor,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    // If the button is pressed, return green, otherwise blue
                    if (states.contains(MaterialState.pressed)) {
                      return baseColor;
                    }
                    return baseColor;
                  }),
                  value: isChecked,
                  shape: CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text_widget(
                    state: 2,
                    name:
                        "Auto renewal (Subscription will be auto renewed base on your package plan)",
                    text_size: 16,
                  ),
                ),
              ],
            ),
          ],
        ))),
      ),
    );
  }
}

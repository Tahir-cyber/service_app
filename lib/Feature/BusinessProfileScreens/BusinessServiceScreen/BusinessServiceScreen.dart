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
import 'package:service_app/Feature/ServiceScreen/ServiceScreen.dart';

import '../SelectDutyDaysScreen/SelectDutyDaysScreen.dart';

class BusinessServiceScreen extends StatefulWidget {
  BusinessServiceScreen({Key? key}) : super(key: key);

  @override
  State<BusinessServiceScreen> createState() => _BusinessServiceScreenState();
}

class _BusinessServiceScreenState extends State<BusinessServiceScreen> {
  bool isChecked = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: SingleChildScrollView(
            child: commonPadding(
          data: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text_widget(
                name: "Add Services",
                text_size: 23,
              ),
              Image.asset(
                images.servicescreen,
                scale: 5,
              ),
              customTextfeild(
                name: "Service Name",
              ),
              fixsize,
              Row(
                children: [
                  Expanded(
                    child: customTextfeild(
                      name: "Service time",
                    ),
                  ),
                  fixsizewidth10,
                  Expanded(
                    child: customTextfeild(
                      name: "Service Price",
                    ),
                  ),
                ],
              ),
              fixsize,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: customTextfeild(
                      name: "Offer discount",
                    ),
                  ),
                ],
              ),
              fixsize,
              Row(
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
                  Text_widget(
                    name: "Get paid after service completion",
                    text_size: 16,
                  ),
                ],
              ),
              fixsize,
              Row(
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
                    value: isChecked2,
                    shape: CircleBorder(),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                  Text_widget(
                    name: "Get paid in advance",
                    text_size: 16,
                  ),
                ],
              ),
              fixsize,
              Custom_button(
                text: "text",
                onpressed: () {},
                data: Text_widget(
                  name: "Add Service",
                  state: 2,
                  Text_color: baseColor,
                  text_size: 20,
                ),
                state: 2,
              ),
              fixsize,
              Custom_button(
                text: "Next",
                onpressed: () {
                  Get.to(SelectDutyDaysScreen());
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

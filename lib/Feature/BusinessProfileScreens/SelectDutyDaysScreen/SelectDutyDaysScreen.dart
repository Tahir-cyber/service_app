// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessSignUpScreen/BusinessSignUpProvider.dart';
import '../../../Backend/core/Enums/enums.dart';
import '../BusinessBankDetailScreen/BusinessBankDetailScreen.dart';

class SelectDutyDaysScreen extends StatefulWidget {
  SelectDutyDaysScreen({Key? key}) : super(key: key);

  @override
  State<SelectDutyDaysScreen> createState() => _SelectDutyDaysScreenState();
}

class _SelectDutyDaysScreenState extends State<SelectDutyDaysScreen> {
  TextFeildata assigndata = TextFeildata();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessSignUpProvider(),
      child: Consumer<BusinessSignUpProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: SingleChildScrollView(
                      child: commonPadding(
                          data: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text_widget(
                        name: "Set Weekly Duties hours",
                        text_size: 22,
                      ),
                      fixsize,
                      Image.asset(
                        images.duty,
                        scale: 4,
                      ),
                      fixsize,
                      fixsize10,
                      Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Text_widget(
                                state: 2,
                                name: "Days",
                                text_size: 16,
                              )),
                          Expanded(
                              flex: 3,
                              child: Text_widget(
                                state: 2,
                                name: "From",
                                text_size: 16,
                              )),
                          Expanded(
                              flex: 3,
                              child: Text_widget(
                                state: 2,
                                name: "To",
                                text_size: 16,
                              )),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: days.length,
                          itemBuilder: (context, index) {
                            return index == 5 || index == 6
                                ? DutyDays(
                                    days: days[index],
                                    state: 2,
                                  )
                                : InkWell(
                                    onTap: () {},
                                    child: DutyDays(
                                      days: days[index],
                                    ),
                                  );
                          }),
                      fixsize,
                      fixsize,
                      Custom_button(
                          text: "Next",
                          onpressed: () async {
                            if (selectdaya.isEmpty) {
                              textFeildata.SelectDays = selectdaya;
                              // log("${selectdaya.length.toString()} ${selectdaya}");
                              log("${assigndata.SelectDays.length.toString()} ${assigndata.SelectDays}");
                              // model.printdata();
                              popUpMessage(
                                  title: "Select day requried",
                                  message: "Please duties select days");
                            } else {
                              log("this is final list $selectdaya");
                              assigndata.SelectDays = selectdaya;
                              log("${selectdaya.length.toString()} ${selectdaya}");
                              log("${assigndata.SelectDays.length.toString()} ${assigndata.SelectDays}");
                              // final BusinessUser = BusinessAppUser();
                              // BusinessUser.selectedServiceDays = selectdaya;
                              // TextFeildata().servicePrice.text;
                              Get.to(() => BusinessBankDetailScreen());
                            }
                          })
                    ],
                  ))),
                ),
              ));
        },
      ),
    );
  }
}

List days = [
  "Monday",
  "Tuesday",
  "Wendnesday",
  "Thursday",
  "Firday",
  "Saturday",
  "Sunday",
];
List<String> selectdaya = [];

class DutyDays extends StatefulWidget {
  DutyDays({required this.days, this.state = 0, super.key});

  String days;
  int state;

  @override
  State<DutyDays> createState() => _DutyDaysState();
}

class _DutyDaysState extends State<DutyDays> {
  TextFeildata assigndata = TextFeildata();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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

                      if (isChecked == true) {
                        selectdaya.add(widget.days);
                        textFeildata.SelectDays = selectdaya;
                        TextFeildata().SelectDays.add(widget.days);

                        // return TextFeildata().SelectDays.add(widget.days);
                      } else {
                        assigndata.SelectDays.remove(widget.days);
                        selectdaya.remove(widget.days);
                      }
                    });
                  },
                ),
                Text_widget(
                  state: 2,
                  name: widget.days,
                  text_size: 15,
                ),
              ],
            )),
        Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightgrey3,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text_widget(
                name: widget.state == 0 ? "10:30 AM" : "Closed",
                text_size: 18,
              ),
            )),
        fixsizewidth10,
        Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightgrey3,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text_widget(
                name: widget.state == 0 ? "6:00 PM" : "Closed",
                text_size: 18,
              ),
            )),
      ],
    );
  }
}

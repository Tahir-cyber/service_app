// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessAddServiceScreen/business_add_screen_services_provider.dart';

import '../../../Backend/core/Enums/enums.dart';
import '../BusinessSignUpScreen/BusinessSignUpProvider.dart';
import '../SelectDutyDaysScreen/SelectDutyDaysScreen.dart';

class BusinessAddServiceScreen extends StatelessWidget {
  BusinessAddServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final employee = FirebaseFirestore.instance.collection('employee');
    return ChangeNotifierProvider(
      create: (context) => BusinessSignUpProvider(),
      child: Consumer<BusinessSignUpProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: lightgrey,
                body: Screenlayout_widget(
                  appbarData: appbar_one(
                    Screenname: "Add Services",
                  ),
                  state: 2,
                  height: 100.h,
                  // paddingstate: 2,
                  screendata: SingleChildScrollView(
                    child: Form(
                      key: model.formkey2,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text_widget(
                              name: "",
                              text_size: 23,
                            ),
                            Image.asset(
                              images.servicescreen,
                              scale: 5,
                            ),
                            customTextfeild(
                              controller: textFeildata.serviceName,
                              name: "Service Name",
                              valdation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter service name";
                                } else {
                                  textFeildata.serviceName.text;
                                  // serviceCategory.text = selectedValue!;
                                  // log("first value $selectedValue \n other ${serviceCategory.text}");
                                }
                                return null;
                              },
                            ),
                            fixsize,
                            Row(
                              children: [
                                Expanded(
                                  child: customTextfeild(
                                    textinputformatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    keybordtype: TextInputType.number,
                                    name: "Service time",
                                    controller: textFeildata.serviceTime,
                                    valdation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter service time";
                                      } else {
                                        textFeildata.serviceTime.text;
                                        // serviceCategory.text = selectedValue!;
                                        // log("first value $selectedValue \n other ${serviceCategory.text}");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                fixsizewidth10,
                                Expanded(
                                  child: customTextfeild(
                                    controller: textFeildata.servicePrice,
                                    name: "Service Price",
                                    textinputformatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(6),
                                    ],
                                    keybordtype: TextInputType.number,
                                    valdation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter service price";
                                      } else {
                                        textFeildata.servicePrice.text;
                                        // serviceCategory.text = selectedValue!;
                                        // log("first value $selectedValue \n other ${serviceCategory.text}");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            fixsize,
                            customTextfeild(
                                textinputformatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(5),
                                ],
                                keybordtype: TextInputType.number,
                                controller: textFeildata.servicediscount,
                                name:
                                    "Offer discount for the first appointment?",
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    textFeildata.servicePrice.text;
                                  } else {
                                    textFeildata.servicePrice.text;
                                    // serviceCategory.text = selectedValue!;
                                    // log("first value $selectedValue \n other ${serviceCategory.text}");
                                  }
                                  return null;
                                }),
                            fixsize,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5.h),
                                      height: 70.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          // color: Colors.green,
                                          ),
                                      child:
                                          Consumer<BusinessAddServicesProvider>(
                                        builder: (context, value, child) =>
                                            InkWell(
                                                onTap: () {
                                                  value
                                                      .getNameAndImageBottomSheet(
                                                          context);
                                                },
                                                child: CircleAvatar(
                                                    backgroundColor: lightgrey5,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: white,
                                                    ))),
                                      ),
                                    ),
                                    Consumer<BusinessAddServicesProvider>(
                                      builder: (context, value, child) {
                                        return Center(
                                          child: Text(
                                            value.name,
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 60.h,
                                  width: 1.w,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Consumer<BusinessAddServicesProvider>(
                                    builder: (context, value, child) {
                                  return SizedBox(
                                    height: 70.h,
                                    width: 0.65.sw,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,

                                        // shrinkWrap: true,
                                        itemCount: value.employeeList.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25.r,
                                                  backgroundImage: FileImage(
                                                      File(value
                                                          .employeeList[index]
                                                          .image)),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  value
                                                      .employeeList[index].name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  );
                                }),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                            fixsize,
                            fixsize,
                            fixsize,
                            Consumer<BusinessAddServicesProvider>(
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: 40.h,
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                    label: Text(
                                      "Add Employee",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onPressed: () {
                                      value.addEmployee();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 2.0, color: Colors.green),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                            Custom_button(
                              text: "ADD SERVICE",
                              onpressed: () {
                                if (model.formkey2.currentState!.validate()) {
                                  Get.to(SelectDutyDaysScreen());
                                }
                              },
                            ),
                            fixsize,
                            // Custom_button(
                            //   text: "Next",
                            //   onpressed: () {
                            //     Get.to(SelectDutyDaysScreen());
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

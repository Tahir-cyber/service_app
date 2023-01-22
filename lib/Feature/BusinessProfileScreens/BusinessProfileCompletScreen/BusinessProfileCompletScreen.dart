// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessBottomNvigation/BusinessBottomNvigation.dart';

import '../../../Backend/core/Enums/enums.dart';
import '../BusinessSignUpScreen/BusinessSignUpProvider.dart';
import '../BusinessSubscriptionScreen/BusinessSubscriptionScreen.dart';

class BusinessProfileCompletScreen extends StatefulWidget {
  BusinessProfileCompletScreen({Key? key}) : super(key: key);

  @override
  State<BusinessProfileCompletScreen> createState() =>
      _BusinessProfileCompletScreenState();
}

class _BusinessProfileCompletScreenState
    extends State<BusinessProfileCompletScreen> {
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
                          children: [
                            fixsize,
                            Center(
                              child: Image.asset(
                                images.blacklogo,
                                scale: 3,
                              ),
                            ),
                            fixsize,
                            fixsize,
                            fixsize,
                            Image.asset(
                              images.correct,
                              scale: 5,
                            ),
                            fixsize,
                            Text_widget(
                              name: "Business Profile Completed",
                              text_size: 22,
                            ),
                            fixsize,
                            SizedBox(
                              width: 300.w,
                              child: Text_widget(
                                name:
                                    "Your have successfully create business/services profile now you can get cusomters",
                                text_size: 17,
                                text_wight: FontWeight.w300,
                                // state: 2,
                                Text_color: lightgrey4,
                              ),
                            ),
                            fixsize,
                            fixsize,
                            fixsize10,
                            SizedBox(
                              width: 300.w,
                              child: Text_widget(
                                name:
                                    "In order to use our platform for providing your services you must read & agree with terms",
                                text_size: 17,
                                text_wight: FontWeight.w300,
                                // state: 2,
                                Text_color: lightgrey4,
                              ),
                            ),
                            fixsize,
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  // fillColor: baseColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    // If the button is pressed, return green, otherwise blue
                                    if (states
                                        .contains(MaterialState.pressed)) {
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
                                Expanded(
                                  child: Text.rich(TextSpan(
                                      style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                      ),
                                      text: 'I have read & agree with ',
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'Terms & Conditions',
                                          style: GoogleFonts.averageSans(
                                              fontSize: 13.sp,
                                              color: baseColor),
                                        )
                                      ])),
                                ),
                              ],
                            ),
                            Custom_button(
                                text: "Done",
                                onpressed: () async {
                                  log('to check Complete profile');
                                  if (isChecked == false) {
                                    popUpMessage(
                                        title: "Terms & Conditions",
                                        message:
                                            "please agree with trems & conditions.");
                                  } else {
                                    await model.assignData();

                                    log("this first asssign list${model.businessUser.listOfBusinessDoc}");
                                    log("this second assign list${model.businessUser.selectedServiceDays}");
                                    log("full assign list${model.businessUser}");

                                    await model.registerUser(
                                        context, model.businessUser);
                                    await model.clearText();
                                    // Get.to(BusinessSubscriptionScreen());
                                  }
                                })
                          ],
                        )),
                      ))));
        },
      ),
    );
  }
}

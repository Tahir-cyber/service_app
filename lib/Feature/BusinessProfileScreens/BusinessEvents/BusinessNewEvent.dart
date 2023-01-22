import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessEvents/EventClasses.dart';

import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';
import '../../OTPScreen/OTPScreen.dart';

class BusinessCreateEvent extends StatelessWidget {
  const BusinessCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              // color: baseColor,
              height: 240.h,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: baseColor2,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    child: Column(children: [
                      fixsize,
                      Image.asset(images.upload),
                      fixsize10,
                      Text_widget(
                        name: "Upload Event Cover Picture",
                        state: 2,
                        Text_color: white,
                        text_size: 18,
                      ),
                      Text_widget(
                        name: "Set an attractive cover to attract customer",
                        state: 2,
                        Text_color: white,
                        text_size: 11,
                      )
                    ]),
                  ),
                  SizedBox(
                      // height: 40.h,
                      )
                ],
              ),
            ),
            commonPadding(
              data: Column(
                children: [
                  customTextfeild(name: "Event Type"),
                  fixsize,
                  customTextfeild(name: "Event Title"),
                  fixsize,
                  customTextfeild(name: "Event Location"),
                  fixsize,
                  Row(
                    children: [
                      Expanded(flex: 5, child: customTextfeild(name: "Attire")),
                      fixsizewidth30,
                      Expanded(
                          flex: 5,
                          child: customTextfeild(name: "Ticket Price")),
                    ],
                  ),
                  fixsize,
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: customTextfeild(name: "Opening Time")),
                      fixsizewidth30,
                      Expanded(
                          flex: 5,
                          child: customTextfeild(name: "Closing Time")),
                    ],
                  ),
                  fixsize,
                  customTextfeild(name: "Event Date"),
                  fixsize,
                  customTextfeild(
                    name: "Event Details",
                    text_feid_height: true,
                  ),
                  fixsize,
                  Custom_button(
                      text: "CONTINUE",
                      onpressed: () {
                        Get.to(EventClasses());
                      }),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

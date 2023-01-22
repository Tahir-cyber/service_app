import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreen.dart';

class NoAppointment extends StatelessWidget {
  const NoAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenlayout_widget(
          appbarData: appbar(state: 2, data: "Appointments"),
          screendata: Column(
            children: [
              fixsize,
              fixsize,
              fixsize,
              Image.asset(
                images.scheduled,
                scale: 4,
              ),
              fixsize,
              fixsize,
              Text_widget(
                name: "No scheduled Appointments",
                text_size: 19,
              ),
              fixsize,
              SizedBox(
                width: 300.w,
                child: Text_widget(
                  name:
                      "All upcoming & completed appointments will be show up here.",
                  text_size: 14,
                ),
              ),
              Spacer(),
              Custom_button(
                text: "Let's get services",
                onpressed: () {
                  Get.to(MapScreen());
                },
                state: 2,
                data: Text_widget(
                  state: 2,
                  name: "Let's get services",
                  text_size: 16,
                  Text_color: baseColor,
                ),
              ),
              Spacer(),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/DeleteAccount/DeleteAccountScreen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenlayout_widget(
          paddingstate: 2,
          appbarData:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            backButton(state: 2),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text_widget(
                name: "My Profile",
                text_size: 19,
                state: 2,
                Text_color: white,
              ),
            ),
          ]),
          screendata: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: lightgrey2,
                          radius: 55.r,
                          backgroundImage: AssetImage(images.profile),
                        ),
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: white,
                          child: IconButton(
                            icon: Icon(
                              color: black,
                              Icons.camera_alt,
                              size: 20.sp,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    customTextfeild(name: "Full Name"),
                    fixsize,
                    customTextfeild(name: "Email"),
                    fixsize,
                    customTextfeild(name: "Phone number"),
                    fixsize,
                    customTextfeild(name: "Location Address"),
                    fixsize,
                    Custom_button(text: "UPDATE PROFILE", onpressed: () {}),
                    fixsize10,
                    fixsize10,
                    fixsize,
                    InkWell(
                      onTap: () {
                        Get.to(const DeleteAccountScreen());
                      },
                      child: Text_widget(
                        name: "Delete Account",
                        state: 2,
                        text_size: 19,
                        Text_color: Colors.red,
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}

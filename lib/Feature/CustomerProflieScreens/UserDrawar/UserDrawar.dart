import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/authservice.dart';
import 'package:service_app/Backend/DatabaseService/datastoreService.dart';
import 'package:service_app/Feature/ServiceScreen/ServiceScreen.dart';

import '../../../Core/appColors.dart';
import '../../../Core/classesInstance.dart';
import '../../../Core/commonMethod.dart';
import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';

class UserDrawar extends StatelessWidget {
  const UserDrawar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
          height: 1.sh,
          width: 290.w,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35.r),
                  bottomRight: Radius.circular(35.r))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.h + ScreenUtil().statusBarHeight,
                  decoration: BoxDecoration(
                      color: baseColor2,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.r),
                          bottomRight: Radius.circular(35.r))),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 65.r,
                          backgroundImage:
                              NetworkImage(activeuser.profileImage.toString()),

                          // AssetImage(images .profile),
                        ),
                        fixsize,
                        Text_widget(
                          name: activeuser.userName.toString(),
                          text_size: 10.sp,
                          state: 2,
                          Text_color: white,
                        ),
                        // minmium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text_widget(
                              name: "Show up:",
                              text_size: 14,
                              state: 2,
                              Text_color: white,
                            ),
                            Text_widget(
                              name: "98%",
                              text_size: 15.sm,
                              state: 2,
                              Text_color: baseColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                commonPadding(
                    data: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commondarwar_data(
                        image: images.drawariamge,
                        onpressed: () {},
                        title: "My Business"),
                    commondarwar_data(
                        image: images.drawariamge2,
                        onpressed: () {},
                        title: "Appointment Settings"),
                    custom_divider(),
                    minmium,
                    commondarwar_data(
                        image: images.drawariamge9,
                        onpressed: () {},
                        title: "Share App"),
                    commondarwar_data(
                        image: images.drawariamge8,
                        onpressed: () {},
                        title: "About us"),
                    SizedBox(height: Get.height / 5),
                    Custom_button(
                      text: "Log Out",
                      onpressed: () {
                        AuthServices()
                            .logout(id: activeuser.appUserId.toString());
                        Get.off(const ServiceScreen());
                      },
                      state: 3,
                      small_size: true,
                      smallColor: Colors.red,
                    )
                  ],
                ))
              ],
            ),
          )),
    );
  }

  InkWell commondarwar_data(
      {String? title, String? image, Function()? onpressed}) {
    return InkWell(
      onTap: onpressed,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image!,
                scale: 3.sm,
              ),
              fixsizewidth10,
              Text_widget(
                name: title!,
                text_size: 12.sm,
              )
            ],
          ),
          fixsize,
        ],
      ),
    );
  }
}

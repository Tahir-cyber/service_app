import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Feature/ServiceScreen/ServiceScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/appColors.dart';
import '../../../Core/classesInstance.dart';
import '../../../Core/commonMethod.dart';
import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';

class BusinessDrawar extends StatelessWidget {
  const BusinessDrawar({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
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
                  height: 180.h + ScreenUtil().statusBarHeight,
                  decoration: BoxDecoration(
                      color: baseColor2,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.r),
                          bottomRight: Radius.circular(35.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 65.r,
                        backgroundImage: AssetImage(images.profile),
                      ),
                      fixsize,
                      Text_widget(
                        name: "Jone Doe",
                        text_size: 23,
                        state: 2,
                        Text_color: white,
                      )
                    ],
                  ),
                ),
                commonPadding(
                    data: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commondarwar_data(
                        image: images.drawariamge,
                        onpressed: () {},
                        title: "Favorites Services"),
                    commondarwar_data(
                        image: images.drawariamge2,
                        onpressed: () {},
                        title: "Appointment Settings"),
                    commondarwar_data(
                        image: images.drawariamge3,
                        onpressed: () {},
                        title: "My Services"),
                    commondarwar_data(
                        image: images.drawariamge4,
                        onpressed: () {},
                        title: "My Events"),
                    commondarwar_data(
                        image: images.drawariamge5,
                        onpressed: () {},
                        title: "Subscription"),
                    commondarwar_data(
                        image: images.drawariamge6,
                        onpressed: () {},
                        title: "Customers Feedback"),
                    custom_divider(),
                    minmium,
                    commondarwar_data(
                        image: images.drawariamge7,
                        onpressed: () {},
                        title: "Terms & Conditions"),
                    commondarwar_data(
                        image: images.drawariamge8,
                        onpressed: () {},
                        title: "About us"),
                    commondarwar_data(
                        image: images.drawariamge9,
                        onpressed: () {},
                        title: "Share App"),
                    Custom_button(
                      text: "Log Out",
                      onpressed: () async {
                        await auth.signOut();

                        Get.off(() => const ServiceScreen());
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool("isBusinss", false);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('firsttime', false);
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
                scale: 3,
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

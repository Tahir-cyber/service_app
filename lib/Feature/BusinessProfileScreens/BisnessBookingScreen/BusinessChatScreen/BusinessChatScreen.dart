import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';

class BusinessChatScreen extends StatelessWidget {
  const BusinessChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenlayout_widget(
        appbarData: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  backButton(state: 2),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: AssetImage(images.profile),
                  ),
                  minmium_width,
                  Text_widget(
                    name: "Robert Smith",
                    text_size: 17,
                    state: 2,
                    Text_color: white,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    images.fly,
                    scale: 4,
                  ),
                  Text_widget(
                    name: "2.4 KM",
                    text_size: 13,
                    state: 2,
                    Text_color: white,
                  ),
                ],
              )
            ]),
        screendata: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: Get.height / 1.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 15.h),
                                decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                child: Text_widget(
                                  name: "hii how are you",
                                  text_size: 13,
                                  state: 2,
                                  Text_color: white,
                                ),
                              ),
                              Row(
                                children: [
                                  Text_widget(
                                    name: "11.25",
                                    text_size: 10,
                                  ),
                                  minmium_width,
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundImage: AssetImage(images.profile),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 15.h),
                                decoration: BoxDecoration(
                                  color: lightgrey3,
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                child: Text_widget(
                                  name: "i am good whaat about you",
                                  text_size: 13,
                                  // state: 2,
                                  // Text_color: ,
                                ),
                              ),
                              Row(
                                children: [
                                  Text_widget(
                                    name: "11.25",
                                    text_size: 10,
                                  ),
                                  minmium_width,
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundImage:
                                        AssetImage(images.profile2),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              customTextfeild(
                name: "Type your message...",
                state: 3,
                data: IconButton(
                  icon: Image.asset(
                    images.fly_green,
                    // color: baseColor,
                    scale: 3,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

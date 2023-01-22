// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessAddServiceScreen/BusinessAddServiceScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessBoostService/BusinessBoostService.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

import '../../../Core/classesInstance.dart';
import '../../../Core/common_widgets.dart';
import '../../CustomerProflieScreens/ShopDetailScreen.dart/Shopdetaildata.dart';

class BusinessMyService extends StatelessWidget {
  const BusinessMyService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Screenlayout_widget(
            paddingstate: 2,
            height: 119.h,
            state: 2,
            screendata: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    minmium,
                    Expanded(
                        child: Custom_button(
                      text: "text",
                      onpressed: () {
                        Get.to(const BusinessBoostService());
                      },
                      state: 6,
                      data: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(images.animation2,
                              height: 40.h, width: 50.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text_widget(
                                    name: "BOOST SERVICES",
                                    text_size: 17,
                                    state: 2,
                                    Text_color: yellow,
                                  ),
                                  fixsizewidth30,
                                  fixsizewidth30,
                                  Image.asset(
                                    images.yellowicon,
                                    scale: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 240.w,
                                child: Text_widget(
                                  name:
                                      "Grow up your business & reach out more customers",
                                  text_size: 11,
                                  state: 2,
                                  Text_color: baseColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        flex: 8,
                        child: ListView.builder(
                            itemCount: image_data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                child: custom_Card(
                                  data: Row(
                                    children: [
                                      Image.asset(
                                        images.chair,
                                        scale: 1.5,
                                      ),
                                      fixsizewidth10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text_widget(
                                                name: "Man's New Haircut",
                                                text_size: 15,
                                              ),
                                              fixsizewidth30,
                                              fixsizewidth20,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    images.cancal,
                                                    scale: 4,
                                                  ),
                                                  Image.asset(
                                                    images.edit,
                                                    scale: 4,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Text_widget(
                                            name: "Time: 25mintues",
                                            text_size: 13,
                                          ),
                                          Text_widget(
                                            name: "Price: \$40",
                                            text_size: 13,
                                          ),
                                        ],
                                      ),
                                      fixsize10,
                                    ],
                                  ),
                                ),
                              );
                            })),
                    Expanded(
                        child: Custom_button(
                      text: "text",
                      onpressed: () {
                        Get.to(BusinessAddServiceScreen());
                      },
                      state: 4,
                      data: Text_widget(
                        name: "Add Servcie",
                        text_size: 20,
                        state: 2,
                        Text_color: baseColor,
                      ),
                    )),
                    minmium,
                  ]),
            ),
            appbarData: appbar_one(
              Screenname: "My Services",
            )));
  }
}

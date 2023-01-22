// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';

import '../../../Core/classesInstance.dart';
import '../../CustomerProflieScreens/ShopDetailScreen.dart/Shopdetaildata.dart';

buttom_sheet() {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(34.r), topLeft: Radius.circular(34.r))),
      height: 640.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34.r),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(images.ticket))),
                  child: Column(
                      // crossAxisAlignment:
                      // CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text_widget(
                            name: "Doe",
                            state: 2,
                            text_size: 17,
                            Text_color: white,
                          ),
                        ),
                        fixsize10,
                        SizedBox(
                          width: 240.w,
                          child: Text_widget(
                            name: "Jamaica Music Festival Ticket",
                            state: 2,
                            text_size: 18,
                            Text_color: white,
                          ),
                        ),
                        minmium,
                        Text_widget(
                          name: "This ticket will valid for one time entry",
                          state: 2,
                          text_size: 13,
                          Text_color: lightgrey6,
                        ),
                        minmium,
                        custom_Card(
                            state: 2,
                            radius: 12.r,
                            data: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text_widget(
                                      name: "29 August",
                                      state: 2,
                                      text_size: 19,
                                      // Text_color: lightgrey6,
                                    ),
                                    minmium,
                                    Text_widget(
                                      name: "09:00 AM - 12:00 PM",
                                      state: 2,
                                      text_size: 12,
                                      // Text_color: lightgrey6,
                                    ),
                                  ],
                                ),
                                fixsizewidth10,
                                fixsizewidth10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text_widget(
                                      name: "Location",
                                      state: 2,
                                      text_size: 19,
                                      // Text_color: lightgrey6,
                                    ),
                                    minmium,
                                    Text_widget(
                                      name: "Downtown, New York",
                                      state: 2,
                                      text_size: 12,
                                      // Text_color: lightgrey6,
                                    ),
                                  ],
                                )
                              ],
                            )),
                        fixsize,
                        fixsize10,
                        Image.asset(
                          images.Qr_code,
                          scale: 3.5,
                        ),
                        // minmium,
                        Text_widget(
                          name: "Appx987GDd8...A2P87",
                          state: 2,
                          text_size: 12,
                          Text_color: lightgrey6,
                        ),
                      ]),
                )),
            minmium,
            Text_widget(
              name: "Show this at event entry point",
              // state: 2,
              text_size: 17,
              // Text_color: white,
            ),
            Custom_button(
              onpressed: () {},
              text: "CONTINUE",
            )
          ],
        ),
      ),
    ),
  );
}

class BusinessEventDetails extends StatelessWidget {
  BusinessEventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 240.h,
                child: Stack(
                  children: [
                    Container(
                      height: 220.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                images.onbording,
                              ),
                              fit: BoxFit.cover),
                          color: black,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50.r),
                              bottomLeft: Radius.circular(50.r))),
                    ),
                    backButton(
                        state: 3,
                        buttonData: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                images.roundbackbutton,
                                scale: 3.5,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 32.h,
                              width: 190.w,
                              decoration: BoxDecoration(
                                  color: black2,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Text_widget(
                                name: "Downtown, New York",
                                Text_color: white,
                                state: 2,
                                text_size: 14,
                              ),
                            ),
                          ],
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Chip(
                          backgroundColor: baseColor,
                          label: Text_widget(
                            name: "29 August",
                            text_size: 13,
                            Text_color: white,
                            state: 2,
                          ),
                        )),
                  ],
                ),
              ),
              commonPadding(
                  data: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(
                    name: "Jamaica Music Festival",
                    text_size: 19,
                  ),
                  minmium,
                  Text_widget(
                    name: "About",
                    text_size: 13,
                  ),
                  minmium,
                  SizedBox(
                      width: 380.w,
                      child: Text_widget(
                        name:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit. In risus neque, commodo quis luctus a, convallis quis sapien. Aliquam vitae pharetra nibh. Sed mollis interdum ante sit amet mollis. Vivamus efficitur tincidunt iaculis. Nunc dapibus urna turpis, sit amet malesuada massa ornare sit amet. Vivamus egestas, velit eget pretium feugiat, dolor tellus tincidunt nisi, sed vestibulum metus nunc quis magna. \n   Sed mollis interdum ante sit amet mollis. Viva mus efficitur tincidunt iaculis. Nunc dapibus urna tur pis, sit amet malesuada massa ornare sit amet. Viva mus egestas, velit eget pretium feugiat, dolor tellus tincidunt nisi.",
                        text_size: 14,
                        state: 2,
                      )),
                  minmium,
                  Text_widget(
                    name: "Event Timeline",
                    text_size: 13,
                  ),
                  custom_Card(
                      data: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text_widget(
                        name: "Opening Festival",
                        text_size: 16,
                      ),
                      Text_widget(
                        name: "09:00 AM - 12:00 PM",
                        text_size: 12,
                      ),
                    ],
                  )),
                  fixsize,
                  fixsize,
                  Custom_button(
                      text: "GET TICKET",
                      onpressed: () {
                        print("tabbad");

                        Get.bottomSheet(
                          Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(34.r),
                                    topLeft: Radius.circular(34.r))),
                            height: 640.h,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              child: Column(
                                children: [
                                  fixsize,
                                  Image.asset(
                                    images.eventclass,
                                    scale: 4,
                                  ),
                                  fixsize10,
                                  Text_widget(
                                    name: "Select your entry class to continue",
                                    text_size: 17,
                                  ),
                                  fixsize,
                                  Custom_button(
                                    text: "General Entry (\$10)",
                                    onpressed: () {
                                      Get.back();
                                      buttom_sheet();
                                    },
                                    smallColor: lightgrey4,
                                    small_size: true,
                                  ),
                                  fixsize,
                                  Custom_button(
                                    text: "Premium Entry (\$30)",
                                    onpressed: () {
                                      Get.back();
                                      buttom_sheet();
                                    },
                                    smallColor: baseColor,
                                    small_size: true,
                                  ),
                                  fixsize,
                                  Custom_button(
                                    text: "VIP Entry (\$50)",
                                    onpressed: () {
                                      Get.back();
                                      buttom_sheet();
                                    },
                                    smallColor: yellow,
                                    small_size: true,
                                    // state: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  fixsize10,
                  Align(
                    alignment: Alignment.center,
                    child: Text_widget(
                      state: 2,
                      Text_color: lightgrey5,
                      name: "1% of the ticket fee will be transfer to App876",
                      text_size: 13,
                    ),
                  ),
                  fixsize,
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

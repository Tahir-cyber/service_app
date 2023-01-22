// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

import '../../ShopDetailScreen.dart/Shopdetaildata.dart';

class EventDetailScreen extends StatelessWidget {
  EventDetailScreen({Key? key}) : super(key: key);

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
                      text: "GET TICKET (\$100)",
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
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10.h),
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(34.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    AssetImage(images.ticket))),
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
                                                  name:
                                                      "Jamaica Music Festival Ticket",
                                                  state: 2,
                                                  text_size: 18,
                                                  Text_color: white,
                                                ),
                                              ),
                                              minmium,
                                              Text_widget(
                                                name:
                                                    "This ticket will valid for one time entry",
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
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text_widget(
                                                            name: "29 August",
                                                            state: 2,
                                                            text_size: 19,
                                                            // Text_color: lightgrey6,
                                                          ),
                                                          minmium,
                                                          Text_widget(
                                                            name:
                                                                "09:00 AM - 12:00 PM",
                                                            state: 2,
                                                            text_size: 12,
                                                            // Text_color: lightgrey6,
                                                          ),
                                                        ],
                                                      ),
                                                      fixsizewidth10,
                                                      fixsizewidth10,
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text_widget(
                                                            name: "Location",
                                                            state: 2,
                                                            text_size: 19,
                                                            // Text_color: lightgrey6,
                                                          ),
                                                          minmium,
                                                          Text_widget(
                                                            name:
                                                                "Downtown, New York",
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
                      }),
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
        // bottomSheet: custom_bottom_sheet(
        //     height: 580,
        //     data: Container(
        //       // height:
        //       color: baseColor,
        //       width: double.infinity,
        //     )),
      ),
    );
  }

  Row reuable_row2({required String day, required time, state = 1}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              images.greendot,
              scale: 1.5,
            ),
            fixsizewidth10,
            Text_widget(
              name: day,
              text_size: 17,
            )
          ],
        ),
        state == 1
            ? Row(
                children: [
                  Text_widget(
                    name: time,
                    text_size: 13,
                  ),
                  fixsizewidth10,
                  Image.asset(
                    images.greendot,
                    scale: 2,
                  ),
                  fixsizewidth10,
                  Text_widget(
                    name: "10:30 AM",
                    text_size: 13,
                  ),
                ],
              )
            : Text_widget(
                name: "Closed",
                state: 2,
                text_size: 14,
                Text_color: Colors.red,
              )
      ],
    );
  }

  Column reusable_row({
    required String name,
    required String image,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text_widget(
              name: name,
              text_size: 18,
            ),
            Image.asset(
              image,
              scale: 3,
            ),
          ],
        ),
        custom_divider(
          state: 3,
        ),
      ],
    );
  }

  Column rating_listtile(int index) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 22.r,
            backgroundImage: AssetImage(
              image_data[index],
            ),
          ),
          trailing: Text_widget(
            name: "3 days ago",
            text_size: 12,
          ),
          title: Text_widget(
            state: 2,
            name: "John doe",
            text_size: 15,
          ),
          subtitle: RatingBar.builder(
            initialRating: 4.5,
            minRating: 1,
            itemSize: 25,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        minmium,
        Text_widget(
            text_size: 12,
            state: 2,
            name:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit. In risus neque,"),
        fixsize10,
        custom_divider(state: 2, endent: 50, indent: 50),
      ],
    );
  }
}

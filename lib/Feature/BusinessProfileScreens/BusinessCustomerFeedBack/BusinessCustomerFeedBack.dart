// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

import '../../CustomerProflieScreens/ShopDetailScreen.dart/ShopDetail.dart';

class BusinessCustomerFeedBack extends StatelessWidget {
  BusinessCustomerFeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: lightgrey,
            body: Screenlayout_widget(
                // state: 2,
                // height: 90.h,
                // paddingstate: 2,
                screendata: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(
                      state: 2,
                      name: "Reviews & Ratings",
                      text_size: 17,
                    ),
                    fixsize,
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            // color: baseColor,
                            image: DecorationImage(
                                image: AssetImage(images.halfcircle))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text_widget(
                              name: "4.9",
                              text_size: 18,
                            ),
                            Text_widget(
                              name: "32 (Clients)",
                              text_size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    fixsize,
                    custom_divider(),
                    fixsize,
                    ListView.builder(
                        itemCount: image_data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return rating_listtile(index);
                        })),
                  ],
                )),
                appbarData: appbar_one(
                  Screenname: "Customers Feedback",
                ))));
  }
}

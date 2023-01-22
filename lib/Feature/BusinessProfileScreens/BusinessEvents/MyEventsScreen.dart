// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import '../../CustomerProflieScreens/ShopDetailScreen.dart/Shopdetaildata.dart';
import 'BusinessEventDetails.dart';
import 'BusinessNewEvent.dart';

class MyBusinessEvent extends StatelessWidget {
  MyBusinessEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: lightgrey,
            body: Screenlayout_widget(
                state: 2,
                height: 90.h,
                // paddingstate: 2,
                screendata: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: image_data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: InkWell(
                                  onTap: () {
                                    print("tab working");
                                  },
                                  child: allEventsListData(index)),
                            );
                          }),
                      Custom_button(
                        text: "Next Events",
                        onpressed: () {
                          Get.to(const BusinessCreateEvent());
                        },
                        state: 2,
                        data: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20.sp,
                              color: baseColor,
                            ),
                            fixsizewidth10,
                            Text_widget(
                                name: "Create Event",
                                state: 2,
                                text_size: 18,
                                Text_color: baseColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                appbarData: appbar_one(
                  Screenname: "My Events",
                ))));
  }
}

allEventsListData(int index) {
  return custom_Card(
      state: 5,
      radius: 10,
      data: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.r),
                    topRight: Radius.circular(18.r)),
                image: DecorationImage(
                    image: AssetImage(
                      image_data[index],
                    ),
                    fit: BoxFit.cover)),
          ),
          minmium,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text_widget(
                  state: 2,
                  name: "Jamaica Music Festival",
                  text_size: 19,
                ),
                Text_widget(
                  state: 2,
                  Text_color: Colors.grey[600],
                  name: "19 ST mile Tread, willow brook",
                  text_size: 15,
                ),
              ],
            ),
          ),
        ],
      ));
}

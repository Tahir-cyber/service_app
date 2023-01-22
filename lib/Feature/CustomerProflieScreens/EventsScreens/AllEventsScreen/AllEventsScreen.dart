import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/EventsScreens/EventDetailScreen/EventDetailScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import '../../ShopDetailScreen.dart/Shopdetaildata.dart';
import '../EventHomeScreen.dart';

class AllEventsScreens extends StatelessWidget {
  const AllEventsScreens({super.key});

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
                name: "Going for Events",
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: image_data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: InkWell(
                                onTap: () {
                                  Get.to(EventDetailScreen());
                                },
                                child: allEventsListData(index)),
                          );
                        })
                  ],
                )),
          )),
    );
  }

  Stack allEventsListData(int index) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        custom_Card(
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
            )),
        Padding(
          padding: EdgeInsets.only(right: 20.w, bottom: 40.h),
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5.r), color: white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text_widget(
                name: "26",
                text_size: 20,
                state: 2,
                Text_color: baseColor,
              ),
              Text_widget(
                name: "August",
                text_size: 13,
                state: 2,
                Text_color: baseColor,
              ),
            ]),
          ),
        )
      ],
    );
  }
}

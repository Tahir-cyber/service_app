import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/EditBusinessProfile.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessHomeScreen/BusinessHomeScreen.dart'
    as appbar;
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

import '../../../Core/classesInstance.dart';
import '../../../Core/common_widgets.dart';
import '../BusinessDrawar/BusinessDrawar.dart';
import '../EditBusinessProfile/BusinessProfileShow.dart';
import 'BusinessEventDetails.dart';
import 'MyEventsempty.dart';

class BusinesseventScreen extends StatelessWidget {
  BusinesseventScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: BusinessDrawar(),
        backgroundColor: white,
        body: Screenlayout_widget(
          appbarData: appbar.appbar(
              state: 2,
              data: "My Event",
              onpressed: () {
                print("click");

                _scaffoldKey.currentState!.openDrawer();
              }),
          paddingstate: 2,
          screendata: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
            child: SingleChildScrollView(
                child: Column(
              children: [
                fixsize10,
                Custom_button(
                  text: "Next Events",
                  onpressed: () {
                    print("happy");
                    Get.to(MyBusinessEventEmpty());
                  },
                  state: 2,
                  data: Text_widget(
                      name: "My Events",
                      state: 2,
                      text_size: 18,
                      Text_color: baseColor),
                ),
                fixsize,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: image_data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(BusinessEventDetails());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            children: [
                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(image_data[index]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: white),
                              ),
                              fixsizewidth20,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text_widget(
                                    name: "Sport Week Fest",
                                    text_size: 18,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        images.map,
                                        scale: 4.0,
                                      ),
                                      fixsizewidth10,
                                      Text_widget(
                                        state: 2,
                                        Text_color: lightgrey4,
                                        name: "19 ST mile Tread, willow brook",
                                        text_size: 12,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        images.calander,
                                        scale: 4.5,
                                      ),
                                      fixsizewidth10,
                                      Text_widget(
                                        state: 2,
                                        Text_color: lightgrey4,
                                        name: "20 Sept, 09:00 AM - 12:00 PM",
                                        text_size: 10,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            )),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/EventsScreens/AllEventsScreen/AllEventsScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/EventsScreens/EventDetailScreen/EventDetailScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import 'package:service_app/Feature/CustomerProflieScreens/UserDrawar/UserDrawar.dart';

import '../ShopDetailScreen.dart/Shopdetaildata.dart';

class EventScreen extends StatelessWidget {
  EventScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const UserDrawar(),
      body: Screenlayout_widget(
          state: 2,
          height: 125.h,
          paddingstate: 2,
          appbarData: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Provider.of<customwidgetProvider>(context, listen: false)
                //     .
                appbar(
                    state: 2,
                    data: "Events",
                    onpressed: () {
                      print("click");

                      _scaffoldKey.currentState!.openDrawer();
                    }),

                fixsize10,
                Searchbar(name: "Search by location or date"),
              ]),
          screendata: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text_widget(
                        name: "Attending Event",
                        text_size: 13,
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(const AllEventsScreens());
                          },
                          child: Text_widget(
                            name: "View all",
                            text_size: 13,
                            state: 2,
                            Text_color: baseColor,
                          )),
                    ],
                  ),
                  fixsize10,
                  SizedBox(
                    height: 150.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: image_data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                print("hii");
                                Get.to(EventDetailScreen());
                              },
                              child: eventListData(index));
                        }),
                  ),
                  fixsize10,
                  Text_widget(
                    name: "Up Coming Events",
                    text_size: 14,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: image_data.length,
                      itemBuilder: (context, index) {
                        return Padding(
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
                                    name: "Late Night, Club Party",
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
                        );
                      }),
                ],
              ),
            ),
          )),
    );
  }

  Stack eventListData(int index, {double? height, double? width}) {
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
                  height: height ?? 100.h,
                  width: width ?? 225.w,
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
                        text_size: 12,
                      ),
                      Text_widget(
                        state: 2,
                        Text_color: Colors.grey[600],
                        name: "19 ST mile Tread, willow brook",
                        text_size: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(right: 20.w, bottom: 25.h),
          child: Container(
            height: 40.h,
            width: 40.w,
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
                text_size: 17,
                state: 2,
                Text_color: baseColor,
              ),
              Text_widget(
                name: "August",
                text_size: 10,
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

// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/ChatScreen/ChatScreen.dart';

import '../MapScreen/MapScreenData.dart';
import '../ShopProfileDetails/ShopProfileDetails.dart';
import 'NoAppointment Screen/NoAppointment.dart';

class UpcomingOrders extends StatelessWidget {
  const UpcomingOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: image_data.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 180.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  padding: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(top: 100.h),
                        height: 180.h,
                        width: 6.w,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r)),
                        ),
                      ),
                      minmium_width,
                      Expanded(
                        child: Column(
                          children: [
                            reuseable_row(
                                state: 2,
                                name: "Appointment Date",
                                image: images.calander,
                                details: "Fri 26, Aug - 10:30 AM",
                                data: InkWell(
                                    onTap: () {
                                      Get.to(ChatScreen());
                                    },
                                    child: Image.asset(
                                      images.chat,
                                      scale: 3,
                                    ))),
                            // custom_divider(),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 22.r,
                                backgroundImage: AssetImage(image_data[index]),
                              ),
                              title: Text_widget(
                                name: "Jason Born",
                                text_size: 17,
                                state: 2,
                              ),
                              subtitle: Text_widget(
                                name: "Haircut + Shave & Facial",
                                text_size: 12,
                                state: 2,
                              ),
                              trailing: InkWell(
                                  onTap: () {
                                    Get.to(NoAppointment());
                                  },
                                  child: Image.asset(images.green_map)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

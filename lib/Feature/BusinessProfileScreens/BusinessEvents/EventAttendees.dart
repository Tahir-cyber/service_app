import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import 'package:service_app/Feature/CustomerProflieScreens/UserProfileScreen/UserProfileScreen.dart';

class EventAttendeesScreen extends StatelessWidget {
  const EventAttendeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 260.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            images.event,
                          ),
                          fit: BoxFit.cover),
                      color: black,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.r),
                          bottomLeft: Radius.circular(50.r))),
                ),
                commonPadding(
                  data: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text_widget(
                        name: "Jamaica Music Festival",
                        text_size: 20,
                      ),
                      Row(
                        children: [
                          Text_widget(
                            name: "Total Attendees:",
                            text_size: 13,
                          ),
                          fixsizewidth30,
                          Text_widget(
                              name: "243",
                              text_size: 17,
                              state: 2,
                              Text_color: lightgrey4),
                        ],
                      ),
                      fixsize,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text_widget(
                            name: "Attendees",
                            text_size: 15,
                          ),
                          Text_widget(
                            name: "Ticket Scan",
                            text_size: 15,
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: image_data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 46.h,
                                        width: 46.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    image_data[index])),
                                            color: baseColor,
                                            borderRadius:
                                                BorderRadius.circular(12.r)),
                                      ),
                                      fixsizewidth10,
                                      Text_widget(
                                        name: "Adam Smith",
                                        text_size: 17,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    images.greenCheck,
                                    scale: 5,
                                  ),
                                ],
                              ),
                            );
                          }),
                      fixsize,
                      Align(
                        alignment: Alignment.center,
                        // heightFactor: 1.2.h,
                        child: Image.asset(
                          images.scan,
                          scale: 6,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Row appbar({state = 1, final String? data}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        images.drawar,
        scale: 3.5,
      ),
      state == 1
          ? Image.asset(
              images.whitelogo_,
              scale: 4,
            )
          : Text_widget(
              name: data!,
              text_size: 19,
              state: 2,
              Text_color: white,
            ),
      // Image.asset(images.),

      InkWell(
        onTap: () {
          Get.to(const UserProfileScreen());
        },
        child: CircleAvatar(
          radius: 15.r,
          backgroundImage: AssetImage(images.profile),
        ),
      ),
    ],
  );
}

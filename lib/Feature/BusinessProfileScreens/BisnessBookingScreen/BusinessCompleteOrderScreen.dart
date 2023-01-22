import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Feature/CustomerProflieScreens/FeedBackScreen/FeedBackScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import 'package:service_app/Feature/CustomerProflieScreens/ShopProfileDetails/ShopProfileDetails.dart';
import '../../../Core/appColors.dart';
import '../../../Core/classesInstance.dart';
import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';

// part 'UpcomingScreen';
class BusinessComplateOrders extends StatelessWidget {
  const BusinessComplateOrders({
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
                return InkWell(
                  onTap: () {},
                  child: Container(
                    // height: 180.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                                      Get.to(const FeedbackScreen());
                                    },
                                    child: SizedBox(
                                      width: 50.w,
                                      child: Text_widget(
                                        name: "Rate your experience",
                                        state: 2,
                                        Text_color: baseColor,
                                        text_size: 10,
                                      ),
                                    ),
                                  )),
                              // custom_divider(),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 22.r,
                                  backgroundImage:
                                      AssetImage(image_data[index]),
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
                                trailing: Image.asset(images.green_map),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

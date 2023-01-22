import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/ConfirmAppointment/ComfirmAppointmentDetails.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/ConfirmAppointment/ConfirmAppointmentScreen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int number = 30;
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
                name: "Leave Feedback",
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
                  fixsize,
                  custom_round_image(image: images.profile2, radius: 65.r),
                  fixsize,
                  Text_widget(
                    name: "John Doe Barber's Shop",
                    text_size: 22,
                  ),
                  fixsize,
                  SizedBox(
                    width: 300.w,
                    child: Text_widget(
                      name:
                          "Your feedback will help service provider to improve services",
                      text_size: 14,
                    ),
                  ),
                  fixsize10,
                  RatingBar.builder(
                    initialRating: 0.0,
                    minRating: 1,
                    itemSize: 35.sp,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_outline_rounded,
                      // size: 40.sp,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  fixsize10,
                  customTextfeild(
                      name: "Leave feedback...", text_feid_height: true),
                  fixsize10,
                  dottedLine(),
                  fixsize10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text_widget(
                        name: "Service Charges",
                        text_size: 19,
                      ),
                      Text_widget(
                        name: "\$70:00 ",
                        text_size: 19,
                      ),
                    ],
                  ),
                  fixsize10,
                  dottedLine(),
                  fixsize,
                  Text_widget(
                    name: "Want to give a tip?",
                    text_size: 22,
                  ),
                  Text_widget(
                    name: "All tip amount will goes to service provider",
                    text_size: 14,
                  ),
                  fixsize,

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text_widget(
                      state: 2,
                      name: "Payment method",
                      text_size: 19,
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tipList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.9,
                              crossAxisSpacing: 14.0,
                              mainAxisSpacing: 14.0),
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              number = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: index == number ? baseColor : lightgrey2,
                                borderRadius: BorderRadius.circular(14.r)),
                            // height: 23,
                            // width: 63,

                            child: index == 0
                                ? Text_widget(
                                    name: "No tip",
                                    text_size: 12,
                                    state: 2,
                                    Text_color: index == number ? white : black,
                                  )
                                : Text_widget(
                                    name: "\$ ${tipList[index]}",
                                    text_size: 12,
                                    state: 2,
                                    Text_color: index == number ? white : black,
                                  ),
                          ),
                        );
                      }),
                  fixsize,
                  ListTile(
                    leading: Image.asset(
                      images.mastercard,
                      scale: 4.5,
                    ),
                    title: Text_widget(
                      state: 2,
                      name: "John Doe",
                      text_size: 13,
                    ),
                    subtitle: Text_widget(
                      state: 2,
                      name: "58** **** **** 4534",
                      text_size: 11,
                    ),
                  ),
                  fixsize,
                  fixsize,
                  Custom_button(
                    text: "Submit",
                    onpressed: () {
                      // Get.to(MapScreen());
                      // Get.to(FeedbackScreen());
                    },
                  ),
                  // Spacer(),
                ],
              ),
            ),
          )),
    );
  }

  CircleAvatar custom_round_image({double? radius, String? image}) {
    return CircleAvatar(
      radius: radius ?? 22.r,
      backgroundImage: AssetImage(image!),
    );
  }
}

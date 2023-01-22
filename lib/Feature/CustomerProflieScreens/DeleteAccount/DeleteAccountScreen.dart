import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/FavoriteServicesScreen/FavoriteServicesScreen.dart';

import '../ShopDetailScreen.dart/Shopdetaildata.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

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
                name: "Delete my Account",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        images.deleteuser,
                        scale: 4,
                      ),
                    ),
                    fixsize10,
                    SizedBox(
                      width: 340.w,
                      child: Text_widget(
                          state: 2,
                          name:
                              "We are really sorry to see you going like this, Please make sure to complete all the  active appointments with barbers and payoff them. Your feedback below will be appreciated.",
                          text_size: 14),
                    ),
                    fixsize10,
                    Text_widget(
                      name: "Verify its you!",
                      text_size: 20,
                    ),
                    fixsize,
                    Text_widget(
                        name: "Name",
                        state: 2,
                        text_size: 13,
                        text_wight: FontWeight.w200),
                    custom_Card(
                        radius: 15.r,
                        state: 2,
                        data: Row(
                          children: [
                            Text_widget(
                              name: "Name",
                              text_size: 19,
                            )
                          ],
                        )),
                    Text_widget(
                        name: "Email",
                        state: 2,
                        text_size: 13,
                        text_wight: FontWeight.w200),
                    custom_Card(
                        radius: 15.r,
                        state: 2,
                        data: Row(
                          children: [
                            Text_widget(
                              name: "Email@gmail.com",
                              text_size: 19,
                            )
                          ],
                        )),
                    fixsize10,
                    Text_widget(
                      name: "Please let's us know",
                      text_size: 20,
                    ),
                    minmium,
                    customTextfeild(name: "Reason for deleting account"),
                    fixsize,
                    customTextfeild(
                      name: "Add description",
                      // state: 2,
                      text_feid_height: true,
                    ),
                    fixsize,
                    Custom_button(
                        text: "DELETE ACCOUNT",
                        onpressed: () {
                          Get.to(const FavoriteServices());
                        }),
                    fixsize10,
                  ],
                )),
          )),
    );
  }
}

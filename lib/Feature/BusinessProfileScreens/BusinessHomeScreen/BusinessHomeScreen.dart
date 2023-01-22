import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/imagepath.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessAppointmentSitting/BusinessAppointmentSittingScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessDrawar/BusinessDrawar.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/EditBusinessProfile.dart';
import 'package:service_app/Feature/BusinessProfileScreens/MyService/MyService.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessServiceScreen/BusinessServiceScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/CustomerDetailsScreen/CustomerDetailScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

import '../../../Core/classesInstance.dart';
import '../../../Core/common_widgets.dart';
import '../EditBusinessProfile/BusinessProfileShow.dart';

class BusinessHomeScreen extends StatelessWidget {
  BusinessHomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: BusinessDrawar(),
        backgroundColor: white,
        body: Screenlayout_widget(
          paddingstate: 2,
          screendata: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fixsize10,
                    Text_widget(
                      name: "My Dashboard",
                      state: 2,
                      text_size: 18,
                      Text_color: lightgrey4,
                      text_wight: FontWeight.w400,
                    ),
                    fixsize10,
                    Container(
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(images.grey_container))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text_widget(
                                  name: "My Wallet",
                                  state: 2,
                                  text_size: 16,
                                  Text_color: white,
                                ),
                              ),
                              fixsize10,
                              Text_widget(
                                name: "\$ 185.00",
                                state: 2,
                                text_size: 23,
                                Text_color: white,
                              ),
                              Text_widget(
                                name: "Personal Balance",
                                state: 2,
                                text_size: 12,
                                Text_color: lightgrey2,
                              ),
                              fixsize,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        images.visa,
                                        scale: 4.3,
                                      ),
                                      fixsizewidth10,
                                      Text_widget(
                                        name: "******* 4534",
                                        state: 2,
                                        text_size: 12,
                                        Text_color: lightgrey2,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 25.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: white,
                                              style: BorderStyle.solid,
                                              width: 2.sp),
                                          // color: baseColor,
                                          borderRadius:
                                              BorderRadius.circular(14.r)),
                                      child: Text_widget(
                                        name: "Withdraw",
                                        state: 2,
                                        text_size: 12,
                                        Text_color: lightgrey2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    fixsize,
                    Text_widget(
                      name: "Awaiting request",
                      state: 2,
                      text_size: 18,
                      Text_color: lightgrey4,
                      text_wight: FontWeight.w400,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: image_data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            padding: EdgeInsets.only(top: 15.h),
                            decoration: BoxDecoration(
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: InkWell(
                                    onTap: () {
                                      Get.to(CustomProfileDetailsScreen());
                                    },
                                    child: CircleAvatar(
                                      radius: 22.r,
                                      backgroundImage:
                                          AssetImage(image_data[index]),
                                    ),
                                  ),
                                  title: Text_widget(
                                    name: "Jason Born",
                                    text_size: 17,
                                    state: 2,
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Image.asset(
                                        images.map,
                                        scale: 4.0,
                                      ),
                                      minmium_width,
                                      SizedBox(
                                        width: 110.w,
                                        child: Text_widget(
                                          name: "07 ST downtown, willow brook",
                                          text_size: 12,
                                          state: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text.rich(TextSpan(
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                          ),
                                          text: 'Show Up:',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '98%',
                                              style: GoogleFonts.averageSans(
                                                  fontSize: 14.sp,
                                                  color: baseColor),
                                            )
                                          ])),
                                    ],
                                  ),
                                ),
                                custom_divider(),
                                commonPadding(
                                    data: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          images.chair,
                                          scale: 1,
                                        ),
                                        Column(
                                          children: [
                                            Text_widget(
                                              name: "Man's New Haircut",
                                              text_size: 15,
                                            ),
                                            Text_widget(
                                              name: "Shiny Haircoloring",
                                              text_size: 15,
                                            ),
                                          ],
                                        ),
                                        fixsize10,
                                      ],
                                    ),
                                    fixsize10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Custom_button(
                                            text: "Accept Request",
                                            onpressed: () {
                                              Get.to(const BusinessMyService());
                                            },
                                            small_size: true,
                                            smallColor: baseColor),
                                        Custom_button(
                                            text: "Remove Request",
                                            onpressed: () {
                                              Get.to(
                                                  BusinessAppointmentSitting());
                                            },
                                            small_size: true,
                                            smallColor: Colors.red),
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          );
                        }),
                  ]),
            ),
          ),
          appbarData: appbar(
              state: 2,
              data: "Home",
              onpressed: () {
                print("click");

                _scaffoldKey.currentState!.openDrawer();
              }),
        ));
  }
}

Row appbar({state = 1, final String? data, Function()? onpressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: onpressed,
        child: Image.asset(
          images.drawar,
          scale: 3.5,
        ),
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
          Get.to(const BusinessProfile());
        },
        child: CircleAvatar(
          radius: 15.r,
          backgroundImage: AssetImage(images.profile),
        ),
      ),
    ],
  );
}

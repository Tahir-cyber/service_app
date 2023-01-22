import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/EditBusinessProfile.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/edit_business_profile_provider.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/UpdateSelectDutyDaysScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/UserProfileScreen/UserProfileScreen.dart';

class BusinessProfile extends StatelessWidget {
  const BusinessProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 240.h,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 230,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      images.onbording,
                                    ),
                                    fit: BoxFit.cover),
                                color: black,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.r),
                                    bottomLeft: Radius.circular(50.r))),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(ShopProfileDetailsScreen());
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            backgroundColor: white,
                            radius: 75.r,
                            child: CircleAvatar(
                              radius: 70.r,
                              backgroundImage: AssetImage(images.profile2),
                            ),
                          ),
                        ),
                      ),
                      backButton(state: 2),
                    ],
                  ),
                ),
                commonPadding(
                  data: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fixsize,
                      customTextfeild(name: "Service Category"),
                      fixsize,
                      customTextfeild(name: "Business Reg. No."),
                      fixsize,
                      customTextfeild(name: "Business Phone number"),
                      fixsize,
                      customTextfeild(name: "Business Email"),
                      fixsize,
                      customTextfeild(name: "Business Website"),
                      fixsize,
                      customTextfeild(
                          name: "Business Details", text_feid_height: true),
                      fixsize,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('employee')
                                    .snapshots(),
                                builder: ((context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  return snapshot.hasData
                                      ? SizedBox(
                                          height: 90.h,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder: ((context, index) {
                                                final DocumentSnapshot
                                                    documentSnapshot =
                                                    snapshot.data!.docs[index];
                                                var id = snapshot
                                                    .data!.docs[index].id;
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Column(
                                                    children: [
                                                      Consumer<
                                                          EditBusinessProfileProvider>(
                                                        builder: (context,
                                                            value, child) {
                                                          return InkWell(
                                                              onTap: () async {
                                                                value.employeeUpdate(
                                                                    documentSnapshot
                                                                        .id);
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 25.r,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        documentSnapshot[
                                                                            'image']),
                                                              ));
                                                        },
                                                      ),
                                                      SizedBox(height: 5.h),
                                                      Text(
                                                        documentSnapshot[
                                                            'name'],
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.green,
                                        );
                                })),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: 230.h,
                              child: ListView.builder(
                                  itemCount: shedule.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          // Get.to(() => ShopDetailScreen(
                                          //      // singleService: singleService![index],
                                          //     )
                                          //     );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: reuable_row2(
                                              day: shedule[index].day,
                                              time: shedule[index].closingTime,
                                              state: shedule[index].state),
                                        ));
                                  })),
                          SizedBox(
                            height: 10.h,
                          ),
                          Custom_button(
                              text: 'Update schedule',
                              small_size: true,
                              onpressed: () {
                                Get.to(() => UpdateSelectDutyDaysScreen());
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Custom_button(
                          text: "EDIT DETAILS",
                          onpressed: () {
                            Get.to(const EditBusinessProfile());
                          },
                          state: 2,
                          data: Text_widget(
                            name: "EDIT DETAILS",
                            state: 2,
                            text_size: 19,
                            Text_color: baseColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Row reuable_row2({required String day, required time, state = 1}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Image.asset(
            images.greendot,
            scale: 1.5,
          ),
          fixsizewidth10,
          Text_widget(
            name: day,
            text_size: 17,
          )
        ],
      ),
      state == 1
          ? Row(
              children: [
                Text_widget(
                  name: "10:30 AM",
                  text_size: 13,
                ),
                fixsizewidth10,
                Image.asset(
                  images.greendot,
                  scale: 2,
                ),
                fixsizewidth10,
                Text_widget(
                  name: time,
                  text_size: 13,
                ),
              ],
            )
          : Text_widget(
              name: "Closed",
              state: 2,
              text_size: 14,
              Text_color: Colors.red,
            )
    ],
  );
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

class Shedule {
  String day;
  String openingTime;
  String closingTime;
  int state;
  Shedule(
      {required this.day,
      required this.state,
      required this.openingTime,
      required this.closingTime});
}

List<Shedule> shedule = [
  Shedule(
      day: "Monday", openingTime: "10:30 AM", closingTime: "6:30 PM", state: 1),
  Shedule(
      day: "Tuesday",
      openingTime: "10:30 AM",
      closingTime: "6:00 PM",
      state: 1),
  Shedule(
      day: "Wednesday",
      openingTime: "10:30 AM",
      closingTime: "6:30 PM",
      state: 1),
  Shedule(
      day: "Thursday",
      openingTime: "10:30 AM",
      closingTime: "6:30 PM",
      state: 1),
  Shedule(
      day: "Friday", openingTime: "10:30 AM", closingTime: "6:30 PM", state: 1),
  Shedule(
      day: "Saturday",
      openingTime: "10:30 AM",
      closingTime: "10:30 PM",
      state: 2),
  Shedule(
      day: "Sunday", openingTime: "10:30 AM", closingTime: "9:30 PM", state: 2),
];

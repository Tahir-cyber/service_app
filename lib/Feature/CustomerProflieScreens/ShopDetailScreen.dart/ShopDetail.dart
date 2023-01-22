import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';
import 'ServiceshopDetails.dart';
import 'Shopdetaildata.dart';

class ShopDetailScreen extends StatefulWidget {
  BusinessAppUser? singleService;
  ShopDetailScreen({Key? key, this.singleService}) : super(key: key);

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

// bool isChecked = false;

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: SingleChildScrollView(
          child: Column(
            key: fourkey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              ///----this is top appbar
              ///
              SizedBox(
                height: 240.h,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.network(widget.singleService!
                                          .businessBackgroundImage
                                          .toString())
                                      .image,
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
                        //Get.back();
                        // Get.to(ShopProfileDetailsScreen());
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: white,
                          radius: 75.r,
                          child: CircleAvatar(
                            radius: 70.r,
                            backgroundImage: Image.network(widget
                                    .singleService!.businessprofileImage
                                    .toString())
                                .image,
                          ),
                        ),
                      ),
                    ),
                    backButton(
                        state: 3,
                        buttonData: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                // print("this is back botton");
                              },
                              child: Image.asset(
                                images.roundbackbutton,
                                scale: 3.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Get.back();
                                log('this is print function');
                              },
                              child: Image.asset(
                                images.heart,
                                scale: 3.5,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),

              commonPadding(
                data: Column(
                  children: [
                    Text_widget(
                      name:
                          "${widget.singleService!.cardHolderName} ${widget.singleService!.serviceCategory}'s Shop",
                      text_size: 20,
                    ),
                    custom_Card(
                      data: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  service = true;
                                  rating = false;
                                  about = false;

                                  Scrollable.ensureVisible(
                                      firstkey.currentContext!);
                                  Scrollable.ensureVisible(
                                      fourkey.currentContext!);
                                });
                              },
                              child: Column(
                                children: [
                                  Text_widget(
                                    name: "Service",
                                    text_size: 17,
                                    state: 2,
                                    Text_color: service == true
                                        ? baseColor
                                        : Colors.black54,
                                  ),
                                  service == true
                                      ? SizedBox(
                                          width: 60.w,
                                          child: Divider(
                                            height: 3.h,
                                            thickness: 3,
                                            color: baseColor,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  rating = true;
                                  service = false;
                                  about = false;
                                  Scrollable.ensureVisible(
                                      secondkey.currentContext!);
                                  Scrollable.ensureVisible(
                                      fourkey.currentContext!);
                                });
                              },
                              child: Column(
                                children: [
                                  Text_widget(
                                    name: "Ratings",
                                    text_size: 17,
                                    state: 2,
                                    Text_color: rating == true
                                        ? baseColor
                                        : Colors.black54,
                                  ),
                                  rating == true
                                      ? SizedBox(
                                          width: 60.w,
                                          child: Divider(
                                            height: 3.h,
                                            thickness: 3,
                                            color: baseColor,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  service = false;
                                  rating = false;
                                  about = true;
                                  Scrollable.ensureVisible(
                                      thridkey.currentContext!);

                                  Scrollable.ensureVisible(
                                      fourkey.currentContext!);
                                });
                              },
                              child: Column(
                                children: [
                                  Text_widget(
                                    name: "About",
                                    text_size: 17,
                                    state: 2,
                                    Text_color: about == true
                                        ? baseColor
                                        : Colors.black54,
                                  ),
                                  about == true
                                      ? SizedBox(
                                          width: 60.w,
                                          child: Divider(
                                            height: 3.h,
                                            thickness: 3,
                                            color: baseColor,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 350.h,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ServiceSopDetails(),
                            SizedBox(
                              // color: lightgrey3,
                              key: secondkey,
                              width: 327.w,
                              // height: double.infinity,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text_widget(
                                        name: "Reviews & Ratings",
                                        text_size: 18,
                                      ),
                                      Text_widget(
                                        name: "5(19)",
                                        text_size: 18,
                                      ),
                                    ],
                                  ),
                                  minmium,
                                  custom_divider(),
                                  fixsize,
                                  SizedBox(
                                    height: 250.h,
                                    child: ListView.builder(
                                        itemCount: image_data.length,
                                        shrinkWrap: true,
                                        //physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          return rating_listtile(index);
                                        })),
                                  ),
                                  SizedBox(height: 50.h),
                                ],
                              ),
                            ),
                            SizedBox(
                              key: thridkey,
                              height: 400.h,
                              width: 327.w,
                              // height: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  reusable_row(
                                      image: images.shopscreen,
                                      name: "19 ST mile Tread, willow brook"),
                                  reusable_row(
                                      image: images.shopscreen3,
                                      name:
                                          "${widget.singleService!.businessPhoneNumber}"),
                                  reusable_row(
                                      image: images.shopscreen2,
                                      name:
                                          "${widget.singleService!.businessWebsite}"),
                                  SizedBox(
                                      width: 330.w,
                                      child: Text_widget(
                                          text_size: 13,
                                          state: 2,
                                          name:
                                              "${widget.singleService!.businessDetails}")),
                                  fixsize10,
                                  Text_widget(
                                    name: "Weekly Duties hours",
                                    text_size: 19,
                                  ),
                                  fixsize10,
                                  SizedBox(
                                      height: 100.h,
                                      child: ListView.builder(
                                          itemCount: widget.singleService!
                                              .selectedServiceDays?.length,
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
                                                      day:
                                                          "${widget.singleService!.selectedServiceDays![index]}",
                                                      time: "10:30 AM"),
                                                ));
                                          })),
                                  // reuable_row2(day: "Monday", time: "10:30 AM"),
                                  fixsize10,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                    name: time,
                    text_size: 13,
                  ),
                  fixsizewidth10,
                  Image.asset(
                    images.greendot,
                    scale: 2,
                  ),
                  fixsizewidth10,
                  Text_widget(
                    name: "10:30 AM",
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

  Column reusable_row({
    required String name,
    required String image,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text_widget(
              name: name,
              text_size: 18,
            ),
            Image.asset(
              image,
              scale: 3,
            ),
          ],
        ),
        custom_divider(
          state: 3,
        ),
      ],
    );
  }
}

Column rating_listtile(int index) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 22.r,
          backgroundImage: AssetImage(
            image_data[index],
          ),
        ),
        trailing: Text_widget(
          name: "3 days ago",
          text_size: 12,
        ),
        title: Text_widget(
          state: 2,
          name: "John doe",
          text_size: 15,
        ),
        subtitle: RatingBar.builder(
          initialRating: 4.5,
          minRating: 1,
          itemSize: 25,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ),
      minmium,
      Text_widget(
          text_size: 12,
          state: 2,
          name:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit. In risus neque,"),
      fixsize10,
      custom_divider(state: 2, endent: 50, indent: 50),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';
import 'package:service_app/Core/common_widgets.dart';

import '../../../Core/appColors.dart';
import '../../../Core/classesInstance.dart';

List<String> image_data = [
  images.event,
  images.onbording,
  images.onbording1,
  images.onbording2,
  images.onbording,
  images.event,
  images.onbording1,
  images.onbording2,
  images.onbording,
  images.event,
  images.onbording1,
  images.onbording2,
];

Padding Bottom_Map_Data({BusinessAppUser? singleService}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 7.w),
    child: SizedBox(
      width: 300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 115.h,
            child: Row(
              children: [
                Container(
                  height: 114.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      image: DecorationImage(
                          image: Image.network(singleService!
                                  .businessprofileImage
                                  .toString())
                              .image,
                          fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      height: 27.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              images.star,
                              // scale: 2,
                            ),
                            Text_widget(
                              name: "(5.0)",
                              text_size: 14,
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(
                    name: "${singleService.cardHolderName}",
                    text_size: 14,
                  ),
                  Text_widget(
                    name: "${singleService.firstServiceName}",
                    text_size: 12,
                  ),
                ],
              ),
              Image.asset(
                images.fly,
                scale: 3.5,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text_widget(
                name: "19 ST mile Tread, willow brook",
                text_size: 12,
              ),
              Text_widget(
                name: "2.7 km",
                text_size: 12,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

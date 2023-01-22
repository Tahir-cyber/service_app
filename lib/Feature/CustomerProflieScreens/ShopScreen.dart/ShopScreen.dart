// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/ShopDetailScreen.dart/ShopDetail.dart';

class ShopScreen extends StatelessWidget {
  List<BusinessAppUser>? singleService;
  ShopScreen({Key? key, this.singleService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: commonPadding(
            data: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(),
            minmium,
            Searchbar(name: "Events, restaurants, hairstylists"),
            minmium,
            Text_widget(
              name: "${singleService![0].serviceCategory}",
              text_size: 23,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: singleService?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Get.to(() => ShopDetailScreen(
                                  singleService: singleService![index],
                                ));
                          },
                          child: shopContainer(
                              singleService: singleService?[index]));
                    })),
          ],
        )),
      ),
    );
  }

  Card shopContainer({BusinessAppUser? singleService}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 22.r,
                backgroundImage: Image.network(
                        singleService!.businessprofileImage.toString())
                    .image,
              ),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text_widget(
                  name: "${singleService.cardHolderName}",
                  text_size: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_widget(
                    name: "${singleService.firstServiceName}",
                    text_size: 12,
                  ),
                  minmium,
                  Row(
                    children: [
                      Image.asset(
                        images.map,
                        scale: 3,
                      ),
                      minmium_width,
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 100.w,
                        child: Text_widget(
                          state: 2,
                          name: "19 ST mile Tread, willow brook",
                          text_size: 12,
                        ),
                      ),
                    ],
                  ),
                  minmium,
                  Row(
                    children: [
                      Image.asset(
                        images.star,
                        scale: 3,
                      ),
                      fixsizewidth10,
                      Text_widget(
                        name: "(5.0)",
                        text_size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Container(
                alignment: Alignment.topCenter,
                width: 81.h,
                child: Row(children: [
                  Image.asset(
                    images.fly,
                    scale: 4,
                  ),
                  Text_widget(
                    name: "30.4 KM",
                    text_size: 14,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

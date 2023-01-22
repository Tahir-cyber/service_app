import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreenData.dart';

class FavoriteServices extends StatelessWidget {
  const FavoriteServices({super.key});

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
                name: "My Favorite Services",
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
                    Searchbar(name: "Events, restaurants, hairstylists"),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: image_data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 13.h),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 125.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.r),
                                          bottomLeft: Radius.circular(5.r),
                                          topRight: Radius.circular(40.r),
                                          bottomRight: Radius.circular(5.r)),
                                      color: white),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 5.0,
                                      left: 16.w,
                                    ),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 28.r,
                                            backgroundImage:
                                                AssetImage(image_data[index]),
                                          ),
                                          fixsizewidth20,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text_widget(
                                                name: "Jason Born",
                                                text_size: 20,
                                              ),
                                              minmium,
                                              ReusableRow(
                                                  imagedata: images.heartbeat,
                                                  namedata:
                                                      "General Physician"),
                                              minmium,
                                              ReusableRow(
                                                  imagedata: images.map,
                                                  namedata:
                                                      "19 ST mile Tread, willow brook"),
                                              minmium,
                                              ReusableRow(
                                                  imagedata: images.star,
                                                  namedata: "(5.0)"),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                                Container(
                                  height: 30.r,
                                  width: 30.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      // alignment: Alignment.centerRight,
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 20.sp,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                )),
          )),
    );
  }

  Row ReusableRow({String? imagedata, String? namedata}) {
    return Row(
      children: [
        Image.asset(
          imagedata!,
          scale: 3,
        ),
        minmium_width,
        Text_widget(
          name: namedata!,
          text_size: 13,
        )
      ],
    );
  }
}

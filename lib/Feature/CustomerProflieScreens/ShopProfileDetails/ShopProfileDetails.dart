import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import '../../../Core/commonMethod.dart';
import '../../../Core/common_widgets.dart';
import '../ReportService/ReportService.dart';
import '../ShopDetailScreen.dart/Shopdetaildata.dart';

class ShopProfileDetailsScreen extends StatelessWidget {
  const ShopProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Screenlayout_widget(
            // paddingstate: 2,
            screendata:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              custom_Card(
                data: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(
                      images.profile,
                    ),
                  ),
                  title: Text_widget(
                    state: 2,
                    name: "John Smith Haircut's",
                    text_size: 17,
                  ),
                  subtitle: Text_widget(
                    name: "207 Halsey Street, Brooklyn, New York, 90001",
                    text_size: 12,
                    state: 2,
                  ),
                ),
              ),
              minmium,
              reuseable_row(
                  name: "Appointment Date",
                  image: images.calander,
                  details: "Fri 26, Aug - 10:30 AM",
                  data: const Text("")),
              reuseable_row(
                  name: "Service",
                  image: images.chair,
                  data: const Text(""),
                  details: "Man's New Haircut"),
              reuseable_row(
                  name: "Location",
                  image: images.map,
                  details: "207 Halsey Street, Brooklyn,New York, 90001",
                  data: const Text("")),
              reuseable_row(
                  name: "Price",
                  image: images.dollor,
                  details: "\$ 30 (Pay via Mobile App)",
                  data: const Text("")),
              Custom_button(text: "DONE", onpressed: () {}, state: 3),
              fixsize10,
              Text_widget(
                state: 2,
                name:
                    "Please make sure to visit the appointment date, to  sustain your show up percentage and avoid abuse or other miss behavior on the platform",
                text_size: 13,
              )
            ]),
            state: 2,
            height: 116,
            appbarData: appbar_one(
                Screenname: "Barber's Details",
                data: InkWell(
                  onTap: () {
                    Get.to(const ServiceReportScreen());
                  },
                  child: Image.asset(
                    images.alert,
                    scale: 4.5,
                  ),
                ),
                state: 2)));
  }
}

Column reuseable_row(
    {required String image, name, details, state = 1, Widget? data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:
            state == 1 ? const EdgeInsets.all(0) : EdgeInsets.only(left: 13.w),
        child: Text_widget(
          name: name,
          text_size: 14,
          state: 2,
        ),
      ),
      minmium,
      Row(
        mainAxisAlignment: state == 1
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    image,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text_widget(
                      name: details,
                      state: 2,
                      text_size: 16,
                    ),
                  ),
                ],
              ),
              data!
            ],
          ),
        ],
      ),
      fixsize10,
      custom_divider(
        state: 3,
      ),
      fixsize,
    ],
  );
}

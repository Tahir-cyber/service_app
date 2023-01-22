import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import '../Appointments Screen/ConfirmAppointment/ConfirmAppointmentScreen.dart';
import 'Shopdetaildata.dart';

class ServiceSopDetails extends StatelessWidget {
  const ServiceSopDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: firstkey,
        children: [
          Text_widget(
            name: "Select Services & Get 10% off for first appointment",
            text_size: 12,
          ),
          minmium,
          SizedBox(
            height: 180.h,
            child: ListView.builder(
              shrinkWrap: false,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ServiceData(serivceName: "Man's New Haircut");
              },
            ),
          ),
          fixsize10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Custom_button(
                    text: "CONTINUE",
                    onpressed: () {
                      Get.to(const ConfirmAppointScreen());
                    }),
                fixsize10,
                tarsparentButton(
                  onpressed: () {},
                  name: "SEND REQUEST",
                  state: 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

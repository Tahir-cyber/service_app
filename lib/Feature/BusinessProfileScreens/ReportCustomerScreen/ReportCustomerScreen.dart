import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';

import '../../../Core/commonMethod.dart';
import '../../../Core/common_widgets.dart';

class CustomerReportScreen extends StatelessWidget {
  const CustomerReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Screenlayout_widget(
            // paddingstate: 2,
            state: 2,
            height: 117,
            screendata: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    fixsize,
                    fixsize,
                    Image.asset(
                      images.alert2,
                      scale: 3,
                    ),
                    customTextfeild(name: "Reason"),
                    customTextfeild(
                        name: "Issue Details", text_feid_height: true),
                    fixsize,
                    Custom_button(text: "Submit", onpressed: () {}),
                  ]),
            ),
            appbarData: appbar_one(
              Screenname: "Report Customer",
            )));
  }

  Column reuseable_row({required String image, name, details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text_widget(
          name: name,
          text_size: 14,
          state: 2,
        ),
        minmium,
        Row(
          children: [
            Image.asset(
              image,
              scale: 2.5,
            ),
            fixsizewidth10,
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
        fixsize10,
        custom_divider(
          state: 3,
        ),
        fixsize,
      ],
    );
  }
}

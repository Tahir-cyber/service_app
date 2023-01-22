import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';

import '../SignUpScreen/signupProvider.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({this.state = 1, Key? key}) : super(key: key);
  int state;

  @override
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey,
        body: commonPadding(
            data: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fixsize,
            Center(
                child:
                    Lottie.asset(images.location, height: 250.h, width: 280.w)),
            const Spacer(),
            Text_widget(
              name: "Turn on location",
              text_size: 27,
            ),
            Center(
              child: Text_widget(
                name: "Locate nearby services providers ",
                text_size: 16,
              ),
            ),
            fixsize,
            Custom_button(
                text: "ENABLE MY LOCATION",
                onpressed: state == 1
                    ? () {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .getLocation(
                          locationState: 1,
                          context: context,
                        );

                        // state == 1
                        //     ? Get.to(GenderSclectionScreen())
                        //     : Get.to(BusinessSubscriptionScreen());
                      }
                    : () {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .getLocation(context: context, locationState: 2);
                      }),
            fixsize,
            // tarsparentButton(
            //     onpressed: () {
            //       state == 1
            //           ? Get.to(GenderSclectionScreen())
            //           : Get.to(BusinessSubscriptionScreen());
            //     },
            //     name: "SKIP FOR NOW",
            //     state: 2)
          ],
        )),
      ),
    );
  }
}

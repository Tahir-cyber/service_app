import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';

class OnbordingData extends StatelessWidget {
  OnbordingData({
    required this.iamgeData,
    required this.name,
    Key? key,
  }) : super(key: key);

  String name;
  String iamgeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r)),
              image: DecorationImage(
                  image: AssetImage(iamgeData), fit: BoxFit.cover)),
        ),
        fixsize,
        Text_widget(
          name: name,
          text_size: 22.sp,
        ),
        fixsize10,
        SizedBox(
          width: 350.w,
          child: Text_widget(
            name:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit.",
            text_size: 17,
          ),
        ),
      ],
    );
  }
}

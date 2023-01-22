import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_widgets.dart';

import '../../../Core/common_var.dart';

bool service = true;
bool rating = false;
bool about = false;

final firstkey = GlobalKey();
final secondkey = GlobalKey();
final thridkey = GlobalKey();
final fourkey = GlobalKey();

Card custom_Card(
    {required Widget data, int state = 1, double? radius, Color? color}) {
  return Card(
    elevation: 2,
    color: state == 4 ? color : lightgrey,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(state == 1 ? 25.r : radius!)),
    child: Padding(
      padding: state == 5
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
      child: data,
    ),
  );
}

Card shopContainer({String? imagedata}) {
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
              backgroundImage: AssetImage(imagedata!),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text_widget(
                name: "John Smith",
                text_size: 17,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text_widget(
                  name: "Hairdresser + Beautician",
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
              width: 78.h,
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

class ServiceData extends StatefulWidget {
  ServiceData({required this.serivceName, super.key});
  String serivceName;

  @override
  State<ServiceData> createState() => _ServiceDataState();
}

class _ServiceDataState extends State<ServiceData> {
  @override
  bool isChecked = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      child: custom_Card(
          state: 2,
          radius: 12.r,
          data: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_widget(
                      name: widget.serivceName,
                      text_size: 14,
                    ),
                    Text_widget(
                      name: "25 min",
                      text_size: 12,
                      Text_color: Colors.grey[600],
                      state: 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text_widget(
                  name: "\$300",
                  text_size: 16,
                ),
              ),
              Expanded(
                flex: 2,
                child: Checkbox(
                  checkColor: Colors.white,
                  // fillColor: baseColor,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    // If the button is pressed, return green, otherwise blue
                    if (states.contains(MaterialState.pressed)) {
                      return black;
                    }
                    return black;
                  }),
                  value: isChecked,
                  shape: CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}

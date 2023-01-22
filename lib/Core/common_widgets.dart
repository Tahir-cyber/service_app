import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/common_var.dart';

class customTextfeild extends StatelessWidget {
  customTextfeild({
    this.onpressed,
    this.data,
    this.keybordtype,
    this.controller,
    this.textinputformatter,
    this.hinttext,
    this.enble_state = 1,
    this.text_feid_height = false,
    this.valdation,
    this.isPassword,
    // this.valdation,
    required this.name,
    this.state = 1,
    Key? key,
  }) : super(key: key);
  TextInputType? keybordtype;
  TextEditingController? controller;
  List<TextInputFormatter>? textinputformatter;
  String name;
  final onpressed;
  String? hinttext;
  int state;
  int enble_state;
  bool text_feid_height;
  bool? isPassword = false;
  Widget? data;

  String? Function(String? val)? valdation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        state == 3
            ? const Text("")
            : Text_widget(
                name: name,
                state: 2,
                text_size: 13,
                text_wight: FontWeight.w200),
        minmium,
        Container(
            height: text_feid_height == true ? 150.h : 57.h,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: lightgrey3,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextFormField(
              obscureText: isPassword == null ? false : isPassword!,
              keyboardType: keybordtype ?? TextInputType.name,
              maxLines: text_feid_height == true ? 6 : 1,
              controller: controller,
              // autovalidateMode: AutovalidateMode.always,
              validator: valdation ??
                  (vlaue) {
                    if (vlaue == null) {
                      return "enter data";
                    }
                    return null;
                  },
              inputFormatters: textinputformatter ?? [],
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                  suffixIcon: state == 1
                      ? const SizedBox()
                      : state == 2
                          ? IconButton(
                              icon: isPassword!
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black26,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black26,
                                    ),
                              onPressed: onpressed)
                          : data!,
                  enabled: enble_state == 1 ? true : false,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: enble_state == 1 ? name : hinttext,
                  hintStyle: GoogleFonts.averageSans()),
            )),
      ],
    );
  }
}

class commonPadding extends StatelessWidget {
  commonPadding({
    required this.data,
    Key? key,
  }) : super(key: key);
  Widget data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
      child: data,
    );
  }
}

class Text_widget extends StatelessWidget {
  Text_widget({
    required this.name,
    this.text_size,
    this.text_wight,
    this.state = 1,
    this.Text_color,
    Key? key,
  }) : super(key: key);

  String name;
  double? text_size;
  // double? text_wight;
  final Color? Text_color;
  FontWeight? text_wight;
  int state;
  @override
  Widget build(BuildContext context) {
    return Text(name,
        // overflow: TextOverflow.ellipsis,
        textAlign: state == 1 ? TextAlign.center : TextAlign.start,
        style: state == 1
            ? GoogleFonts.averageSans(
                fontWeight: FontWeight.w500,
                fontSize: text_size!.sp,
                color: Colors.black,
              )
            : GoogleFonts.averageSans(
                fontWeight: text_wight,
                fontSize: text_size!.sp,
                color: Text_color,
              ));
  }
}

class Custom_button extends StatelessWidget {
  Custom_button({
    required this.text,
    required this.onpressed,
    this.data,
    this.state = 1,
    this.smallColor,
    this.small_size = false,
    Key? key,
  }) : super(key: key);

  String text;
  Function() onpressed;
  int state;
  bool small_size;
  Widget? data;
  Color? smallColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      // ignore: sort_child_properties_last
      child: state == 1
          ? Text_widget(
              state: 2,
              name: text,
              text_size: 16,
              Text_color: white,
            )
          : state == 3
              ? Text_widget(
                  state: 2,
                  name: text,
                  text_size: 16,
                  Text_color: white,
                )
              : data,
      style: ElevatedButton.styleFrom(
          backgroundColor: small_size == true
              ? smallColor
              : state == 1
                  ? baseColor
                  : state == 3
                      ? black
                      : white,
          // primary: state == 1 ? baseColor : white,
          minimumSize: Size(small_size == true ? 125.w : double.infinity,
              small_size == true ? 40.h : 45.h),
          side: state == 1
              ? BorderSide.none
              : state == 3
                  ? BorderSide.none
                  : state == 6
                      ? BorderSide(
                          width: 2.sp,
                          color: yellow,
                        )
                      : BorderSide(
                          width: 2.sp,
                          color: baseColor,
                        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.r),
          )),

      // ButtonStyle(
      //   shape:
      // )
    );
  }
}

class Screenlayout_widget extends StatelessWidget {
  Screenlayout_widget({
    required this.screendata,
    required this.appbarData,
    this.state = 1,
    this.paddingstate = 1,
    this.height,
    Key? key,
  }) : super(key: key);

  Widget screendata;
  Widget appbarData;
  double? height;
  int state;
  int paddingstate;

  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.sp),
          // alignment: Alignment.center,
          width: double.infinity,
          height: state == 1 ? 114.h : height!.h,
          decoration: BoxDecoration(
              color: baseColor2,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r))),
          child: appbarData,
        ),
        Expanded(
            child: paddingstate == 1
                ? commonPadding(data: screendata)
                : screendata),
      ],
    );
  }
}

//bottomSheet
class custom_bottom_sheet extends StatelessWidget {
  custom_bottom_sheet({
    this.State = 1,
    required this.data,
    this.height,
    Key? key,
  }) : super(key: key);
  int State;
  Widget data;
  double? height;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (context) => Container(
          color: Colors.grey.shade200,
          width: double.infinity,
          height: State == 1 ? height!.h : 55.h,
          child: data),
      enableDrag: false,
      onClosing: () {},
    );
  }
}

//back button

class backButton extends StatelessWidget {
  backButton({
    this.state = 1,
    this.buttonData,
    Key? key,
  }) : super(key: key);
  int state;
  Widget? buttonData;

  @override
  Widget build(BuildContext context) {
    return state == 1 || state == 2
        ? IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              print("pressedback");
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: state == 1 ? black : white,
              size: 25.sp,
            ))
        : buttonData!;
  }
}

//common image pick

pickImage({
  BuildContext? context,
  Function()? onpressed,
  Function()? onpressed2,
}) {
  Get.bottomSheet(
    SingleChildScrollView(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text_widget(
                  name: "Upload Image",
                  text_size: 2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                    onTap: onpressed ?? () {},
                    child: Text_widget(
                      name: "Camera",
                      text_size: 20,
                    )),
                fixsize,
                InkWell(
                    onTap: onpressed2 ?? () {},
                    child: Text_widget(
                      name: "Gallery",
                      text_size: 20,
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignUpScreen/signupProvider.dart';

import '../../../Backend/core/Enums/enums.dart';
import '../../../Core/common_var.dart';
import '../../../Core/common_widgets.dart';
import 'BusinessSignUpProvider.dart';

class BusinessSignupScreen extends StatefulWidget {
  const BusinessSignupScreen({Key? key}) : super(key: key);

  @override
  State<BusinessSignupScreen> createState() => _BusinessSignupScreen();
}

class _BusinessSignupScreen extends State<BusinessSignupScreen> {
  final List<String> items = [
    'Adult Bars Entertainment',
    'Architect',
    'Auto Mechanic',
    'Barbers',
    'Beautician',
    'Boutiques',
    'Construction',
    'Dentist',
    'Designer Stylist',
    'Doctors',
    'Gym',
    'Hair Stylist',
    'Hardware',
    'Hotels',
    'Message Therapist',
    'Night Club',
    'Personal Trainer',
    'Realtors',
  ];

  final List<String> items2 = [
    'Male',
    'Female',
  ];
  final List<String> items3 = [
    '3-5',
    '6-10',
    '11-15',
    '16-20',
    '20-24',
  ];

  String countryCode = "+44";
  String? finalPhoneNumber;

  @override
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessSignUpProvider(),
      child: Consumer<BusinessSignUpProvider>(
        builder: (context, model, child) {
          imageopen({int state = 1}) {
            Get.bottomSheet(SingleChildScrollView(
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
                            onTap: () {
                              Get.back();
                              state == 1
                                  ? model.getImage(ImageSource.camera)
                                  : model.getImage2(ImageSource.camera);
                            },
                            child: Text_widget(
                              name: "Camera",
                              text_size: 20,
                            )),
                        fixsize,
                        InkWell(
                            onTap: () {
                              Get.back();

                              state == 1
                                  ? model.getImage(ImageSource.gallery)
                                  : model.getImage2(ImageSource.gallery);
                              // model.getImage(ImageSource.gallery);
                            },
                            child: Text_widget(
                              name: "Gallery",
                              text_size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ));
          }

          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        // color: baseColor,
                        height: 240.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              children: [
                                Container(
                                    height: 200.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: baseColor2,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.r),
                                            bottomRight:
                                                Radius.circular(20.r))),
                                    child: model.imagedata == null
                                        ? Column(children: [
                                            fixsize,
                                            InkWell(
                                                onTap: () {
                                                  imageopen();
                                                },
                                                child:
                                                    Image.asset(images.upload)),
                                            fixsize10,
                                            Text_widget(
                                              name:
                                                  "Upload Background Banner/Video",
                                              state: 2,
                                              Text_color: white,
                                              text_size: 18,
                                            )
                                          ])
                                        : InkWell(
                                            onTap: () {},
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20)),
                                              child: Image.memory(
                                                model.imagedata!
                                                    .readAsBytesSync(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                const SizedBox()
                              ],
                            ),
                            CircleAvatar(
                              radius: 64.r,
                              backgroundColor: lightgrey6,
                              child: CircleAvatar(
                                  radius: 60.r,
                                  backgroundColor: white,
                                  child: model.imagedata2 == null
                                      ? Center(
                                          child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  imageopen(state: 2);
                                                },
                                                icon: Icon(
                                                  Icons.camera_alt,
                                                  color: lightgrey6,
                                                  size: 50.sp,
                                                )),
                                            minmium,
                                            SizedBox(
                                                width: 80.w,
                                                child: Text_widget(
                                                    name: "Upload Company Logo",
                                                    text_size: 12)),
                                          ],
                                        ))
                                      : CircleAvatar(
                                          radius: 60.h,
                                          backgroundColor: white,
                                          backgroundImage: MemoryImage(
                                            model.imagedata2!.readAsBytesSync(),
                                          ),
                                        )),
                            ),
                          ],
                        ),
                      ),
                      commonPadding(
                        data: Form(
                          key: model.formkey,
                          child: Column(
                            children: [
                              fixsize,
                              minmium,
                              minmium,
                              Custom_drop_down(
                                  state: 2,
                                  Items: items,
                                  SelectValue: selectedValue,
                                  title: "Service Category",
                                  image: images.chair,
                                  name: "Select Service"),
                              fixsize,
                              customTextfeild(
                                name: "Business Reg No.",
                                controller: businessuserRegNo,
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter business reg_no";
                                  } else {
                                    businessuserRegNo.text;
                                    // serviceCategory.text = selectedValue!;
                                    // log("first value $selectedValue \n other ${serviceCategory.text}");
                                  }
                                  return null;
                                },
                              ),
                              fixsize,
                              Custom_drop_down(
                                  SelectValue: selectedValue2,
                                  Items: items2,
                                  title: "Service for",
                                  image: images.gender,
                                  name: "Male / Female"),
                              fixsize,
                              Custom_drop_down(
                                  SelectValue: selectedValue3,
                                  Items: items3,
                                  title: "Number of employees",
                                  image: images.group,
                                  name: "3-5"),
                              fixsize,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text_widget(
                                      name: "Phone number",
                                      state: 2,
                                      text_size: 13,
                                      text_wight: FontWeight.w200),
                                  minmium,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: lightgrey3,
                                    ),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: CountryCodePicker(
                                            // hideMainText: true,
                                            searchStyle: GoogleFonts.poppins(),
                                            initialSelection: 'United Kingdom',
                                            flagDecoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            textStyle: customStyle,

                                            textOverflow: TextOverflow.ellipsis,
                                            showFlag: true,
                                            onChanged: (value) {
                                              model.Customsetsate(
                                                () {
                                                  countryCode = value.dialCode!;
                                                  print(
                                                      "this is code $countryCode");
                                                },
                                                countryCode = value.dialCode!,
                                              );
                                            },
                                            boxDecoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                            // showDropDownButton: true,
                                            showCountryOnly: true,
                                            padding: const EdgeInsets.all(0),
                                            showFlagDialog: true,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60.h,
                                          width: 140.w,
                                          child: TextFormField(
                                            style: customStyle,
                                            controller: businessuserPhonenumber,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Enter phone number';
                                              } else {
                                                businessuserPhonenumber.text;
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              // model.userPhonenumber.text =
                                              //     countryCode + value;
                                            },
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                  top: 10.h,
                                                  right: 10.w,
                                                ),
                                                border: InputBorder.none,
                                                hintText: 'Phone number',
                                                hintStyle: customStyle),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              fixsize,
                              customTextfeild(
                                name: "Business Email",
                                controller: businessuserEmail,
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter email";
                                  } else {
                                    businessuserEmail.text;
                                  }
                                  return null;
                                },
                              ),
                              fixsize,
                              customTextfeild(
                                name: "Password",
                                controller: businessuserPassword,
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter Password";
                                  } else {
                                    businessuserPassword.text;
                                  }
                                  return null;
                                },
                              ),
                              fixsize,
                              customTextfeild(
                                name: "Business Website",
                                controller: businessuserWebsite,
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    businessuserWebsite.text;
                                  } else {
                                    businessuserWebsite.text;
                                  }
                                  return null;
                                },
                              ),
                              fixsize,
                              customTextfeild(
                                name: "Business Details",
                                text_feid_height: true,
                                controller: businessuserDetails,
                                valdation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter business detail";
                                  } else {
                                    businessuserDetails.text;
                                  }
                                  return null;
                                },
                              ),
                              fixsize,
                              Consumer<SignUpProvider>(
                                builder: (context, value, child) {
                                  return Custom_button(
                                      text: "Next",
                                      onpressed: () async {
                                        // log('print all the controller');
                                        // log(selectedValue.toString());
                                        // log(businessuserRegNo.text);
                                        // log(selectedValue2.toString());
                                        // log(selectedValue3.toString());
                                        // log("This is business vaure" +
                                        //     businessuserPhonenumber.text);
                                        if (model.formkey.currentState!
                                            .validate()) {
                                          if (model.imagedata == null) {
                                            Get.snackbar(
                                                "background image requried",
                                                "Please select image",
                                                backgroundColor: Colors.green);
                                          } else if (model.imagedata2 == null) {
                                            Get.snackbar(
                                              backgroundColor: baseColor,
                                              "Profile image requried",
                                              "Please select image",
                                            );
                                          } else if (selectedValue == null ||
                                              selectedValue2 == null ||
                                              selectedValue3 == null) {
                                            print(
                                                "this is value data after $selectedValue ");

                                            print(
                                                "this is value data after ${noOfEmployees.text} ${serviceFor.text} ${serviceCategory.text}");

                                            Get.snackbar(
                                              "AllDropdown select requried",
                                              "Please select (Category/Service_For & No of Employe)",
                                            );
                                          } else {
                                            finalPhoneNumber = countryCode +
                                                businessuserPhonenumber.text;
                                            // model.setState(ViewState.busy);
                                            await model.uploadImages();
                                            // model.printdata();
                                            await model.verfiyaccount(
                                                finalPhoneNumber:
                                                    finalPhoneNumber
                                                        .toString());
                                            // model.setState(ViewState.idle);
                                            print(
                                                "this is value data after ${noOfEmployees.text} ${serviceFor.text} ${serviceCategory.text}");
                                            print("all done");
                                          }
                                        }

                                        ///release form here

                                        // Get.to(OTPScreen(
                                        //   verificationId: "12345656",
                                        //   phoneNumber: "+6584456u6544",
                                        //   state: 2,
                                        // ));
                                      });
                                },
                              ),
                              fixsize10,
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ));
        },
      ),
    );
  }
}

class Custom_drop_down extends StatefulWidget {
  Custom_drop_down(
      {required this.Items,
      this.image,
      this.name,
      this.title,
      this.state = 0,
      this.SelectValue,
      super.key});
  List<String> Items;
  int state;
  String? image, name, title;
  String? SelectValue;

  @override
  State<Custom_drop_down> createState() => _Custom_drop_downState();
}

class _Custom_drop_downState extends State<Custom_drop_down> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text_widget(
            name: widget.title!,
            state: 2,
            text_size: 13,
            text_wight: FontWeight.w200),
        minmium,
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              alignment: Alignment.topCenter,
              hint: SizedBox(
                height: 30.h,
                child: Row(
                  children: [
                    Image.asset(
                      widget.image!,
                      scale: 2.7,
                    ),
                    fixsizewidth10,
                    Expanded(
                        child: Text_widget(
                      name: widget.name!,
                      text_size: 13,
                      state: 2,
                    )),
                  ],
                ),
              ),
              items: widget.Items.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Text_widget(
                          name: item,
                          text_size: 13,
                          state: 2,
                        )
                      ],
                    ),
                  )).toList(),
              value: widget.SelectValue,

              onChanged: (value) {
                setState(() {
                  widget.SelectValue = value as String;

                  if (widget.name == "Select Service") {
                    selectedValue = value;
                    serviceCategory.text = value;
                  } else if (widget.name == "Male / Female") {
                    selectedValue2 = value;
                    serviceFor.text = value;
                  } else if (widget.name == "3-5") {
                    selectedValue3 = value;
                    noOfEmployees.text = value;
                    // selectedValue = value;

                  }
                });
                print("SelectValue ${widget.SelectValue}");
              },

              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 24.sp,
              iconEnabledColor: black,
              iconDisabledColor: baseColor,
              buttonHeight: 50.h,
              buttonWidth: 260.w,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: lightgrey3,
              ),
              // dropdownOverButton: true,
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: widget.state == 0 ? 200.h : 400.h,
              dropdownWidth: 260,

              dropdownPadding: EdgeInsets.only(
                left: 50.w,
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(25),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: false,
              offset: const Offset(-20, 0),
            ),
          ),
        ),
      ],
    );
  }
}

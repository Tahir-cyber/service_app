import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignInScreenCustomers/SignInScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignUpScreen/signupProvider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  bool isChecked = false;
  String countryCode = "+44";
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, model, child) {
          imageopen() {
            Get.bottomSheet(SingleChildScrollView(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Container(
                  color: Colors.white,
                  height: 260,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text_widget(
                          name: "Upload Image",
                          text_size: 15,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                              model.getImage(ImageSource.camera);
                            },
                            child: Text_widget(
                              name: "Camera",
                              text_size: 20,
                            )),
                        fixsize,
                        InkWell(
                            onTap: () {
                              Get.back();
                              model.getImage(ImageSource.gallery);
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
                    child: commonPadding(
                        data: Form(
                      key: model.formkey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              images.blacklogo,
                              scale: 3,
                            ),
                          ),
                          fixsize,
                          minmium,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text_widget(
                                name: "Create account",
                                text_size: 20,
                              ),
                              Column(
                                children: [
                                  model.imagedata == null
                                      ? CircleAvatar(
                                          backgroundColor: lightgrey2,
                                          radius: 35.r,
                                          child: Center(
                                              child: IconButton(
                                            icon: Icon(
                                              color: Colors.black,
                                              Icons.camera_alt,
                                              size: 20.sp,
                                            ),
                                            onPressed: () async {
                                              await imageopen();
                                            },
                                          )),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            imageopen();
                                          },
                                          child: CircleAvatar(
                                            radius: 35.r,
                                            backgroundColor: white,
                                            backgroundImage: MemoryImage(model
                                                .imagedata!
                                                .readAsBytesSync()),
                                          ),
                                        ),
                                  Text_widget(
                                      name: "Upload Photo", text_size: 12)
                                ],
                              ),
                            ],
                          ),
                          minmium,
                          customTextfeild(
                            name: "Full name",
                            controller: userName,
                            valdation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter name";
                              } else {
                                userName.text;
                              }
                            },
                          ),
                          fixsize10,
                          customTextfeild(
                            name: "Email",
                            controller: userEmail,
                            valdation: (value) {
                              if (value == null || value.isEmpty) {
                                return " Please enter email";
                              } else {
                                userEmail.text;
                              }
                            },
                          ),
                          fixsize10,
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
                                        flagDecoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // border: Border.all(

                                          //color: blackColor, width: 2),
                                        ),
                                        textStyle: customStyle,

                                        textOverflow: TextOverflow.ellipsis,
                                        showFlag: true,
                                        onChanged: (value) {
                                          setState(() {
                                            // countryCode = dialCode!;
                                            countryCode = value.dialCode!;
                                          });

                                          print(
                                              "this is phone number ${countryCode + value.dialCode!}");
                                        },
                                        boxDecoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(12.r)),
                                        // showDropDownButton: true,
                                        showCountryOnly: true,
                                        padding: EdgeInsets.all(0),
                                        showFlagDialog: true,
                                      ),
                                    ),
                                    Container(
                                      height: 60.h,
                                      width: 140.w,
                                      child: TextFormField(
                                        style: customStyle,
                                        controller: userPhonenumber,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter phone number';
                                          } else {
                                            userPhonenumber.text;
                                          }
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
                          fixsize10,
                          customTextfeild(
                            isPassword: true,
                            name: "Password",
                            controller: userPassword,
                            valdation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Password ";
                              } else {
                                userPassword.text;
                              }
                            },
                          ),
                          fixsize10,
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                // fillColor: baseColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // If the button is pressed, return green, otherwise blue
                                  if (states.contains(MaterialState.pressed)) {
                                    return baseColor;
                                  }
                                  return baseColor;
                                }),
                                value: isChecked,

                                shape: CircleBorder(),
                                onChanged: (bool? value) {
                                  // model.valuechange(value!);
                                  setState(() {
                                    isChecked = value!;
                                    print("ischeck $isChecked");
                                  });
                                },
                              ),
                              Expanded(
                                child: Text.rich(TextSpan(
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                    ),
                                    text: 'I have read & agree with',
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: GoogleFonts.averageSans(
                                            fontSize: 14.sp, color: baseColor),
                                      )
                                    ])),
                              ),
                            ],
                          ),
                          fixsize,
                          Custom_button(
                              text: "SignUp",
                              onpressed: () async {
                                // localDataBaseObject.clearlocaldatabase();
                                if (model.formkey.currentState!.validate()) {
                                  if (model.imagedata == null) {
                                    Get.snackbar(
                                        "Image Requried", "Please Select Image",
                                        backgroundColor: Colors.green);
                                  } else if (isChecked == false) {
                                    Get.snackbar(
                                      "Terms & conditions",
                                      "Please Accept Term & conditions",
                                    );
                                  } else {
                                    userPhonenumber.text =
                                        countryCode + userPhonenumber.text;
                                    await model.uploadImages();

                                    // log(model.userEmail.text);
                                    // log(model.userprofileimage.text);
                                    // print(
                                    //     "object ${model.userprofileimage.text}");
                                    // print(
                                    //     "object 2 ${model.userPhonenumber.text}");
                                    // log("number  ${model.userprofileimage.text}");
                                    // model.assignData();
                                    // model.printfun();
                                    // ignore: use_build_context_synchronously
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return OTPScreen(
                                    //       phoneNumber: "306806710",
                                    //       verificationId: "123456");
                                    // }));
                                    // Get.to(OTPScreen(
                                    //     phoneNumber: "306806710",
                                    //     verificationId: "123456"));

                                    await model.verfiyaccount();

                                    // Get.to(() => OTPScreen(
                                    //       phoneNumber:
                                    //           model.userPhonenumber.text,
                                    //       verificationId: "1234",
                                    //     ));
                                    // model.authServices.verifyPhoneNumber(
                                    //     phoneNumber: model.appUser.phoneNumber
                                    //         .toString());
                                  }
                                }
                                // Get.to(OTPScreen());
                              }),
                          fixsize10,
                          bottom_page(
                            name: "SIGN IN",
                            detail: "Already have an account",
                            onpressed: () {
                              Get.to(() => CustomerSignInScreen());
                            },
                          ),
                          fixsize10
                        ],
                      ),
                    )),
                  ),
                ),
              ));
        },
      ),
    );
  }

  SingleChildScrollView pickimage_bottomsheet({
    VoidCallback? onpressed,
    VoidCallback? onpressed2,
  }) {
    return SingleChildScrollView(
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
                    onTap: onpressed,
                    child: Text_widget(
                      name: "Camera",
                      text_size: 20,
                    )),
                fixsize,
                InkWell(
                    onTap: onpressed2,
                    child: Text_widget(
                      name: "Gallery",
                      text_size: 20,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InkWell bottom_page({String? name, Function()? onpressed, String? detail}) {
  return InkWell(
    onTap: onpressed,
    child: Column(
      children: [
        Text_widget(
          name: detail!,
          state: 2,
          text_size: 14,
          Text_color: Colors.black38,
          text_wight: FontWeight.w200,
        ),
        minmium,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back, size: 16.sp),
            fixsizewidth10,
            Text_widget(
              name: name!,
              state: 2,
              text_size: 16,
              text_wight: FontWeight.w200,
            ),
          ],
        ),
      ],
    ),
  );
}

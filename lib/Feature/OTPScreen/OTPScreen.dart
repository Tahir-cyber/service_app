import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessSignUpScreen/BusinessSignUpProvider.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignUpScreen/signupProvider.dart';
import '../../Backend/core/Enums/enums.dart';
import '../../Core/classesInstance.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen(
      {required this.phoneNumber,
      required this.verificationId,
      this.state = 1,
      Key? key})
      : super(key: key);
  int state;
  String phoneNumber = "";
  String verificationId;
  String otp = "";

  @override
  // bool isChecked = false;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: commonPadding(
                      data: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(images.animation,
                                height: 250.h, width: 280.w)),
                        Text_widget(
                          name: "Enter OTP",
                          text_size: 18,
                        ),
                        fixsize,
                        OtpTextField(
                          borderRadius: BorderRadius.circular(10.r),
                          numberOfFields: 6,
                          // borderColor: baseColor,
                          // enabledBorderColor: baseColor,
                          focusedBorderColor: baseColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            print("print code $code");

                            //handle validation or checks here
                          },

                          onSubmit: (String verificationCode) {
                            print("print code $verificationCode");

                            otp = verificationCode;
                          }, // end onSubmit
                        ),
                        fixsize10,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text_widget(
                            name: "PhoneNumber",
                            text_size: 14,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text_widget(
                            name: phoneNumber,
                            text_size: 16,
                          ),
                        ),
                        fixsize10,
                        Custom_button(
                            text: "VERIFY OTP",
                            onpressed: () async {
                              print("verify $verificationId");

                              model.verifyOtp(
                                  pagestate: state == 1 ? 1 : 2,
                                  verificationId: verificationId,
                                  otp: otp);
                            }),
                        fixsize10,
                        InkWell(
                          onTap: () async {
                            // model.verfiyaccount();
                            await Provider.of<BusinessSignUpProvider>(context,
                                    listen: false)
                                .verfiyaccount(finalPhoneNumber: phoneNumber);
                          },
                          child: Text_widget(
                            name: "RESEND OTP",
                            state: 2,
                            text_size: 15,
                            Text_color: baseColor,
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ));
        },
      ),
    );
  }
}

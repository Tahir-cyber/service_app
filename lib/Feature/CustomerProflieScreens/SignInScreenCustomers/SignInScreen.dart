// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignInScreenCustomers/SginProvider.dart';
import '../SignUpScreen/SignUpScreen.dart';

class CustomerSignInScreen extends StatelessWidget {
  const CustomerSignInScreen({Key? key}) : super(key: key);

  @override
  // bool isChecked = false;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SigninProvider(),
      child: Consumer<SigninProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: SingleChildScrollView(
                    child: commonPadding(
                        data: Form(
                      key: model.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text_widget(
                            name: "Login account",
                            text_size: 20,
                          ),
                          fixsize10,
                          customTextfeild(
                            name: "Email",
                            controller: model.userEmailController,
                            valdation: (value) {
                              // ignore: unnecessary_null_comparison
                              if (value!.isEmpty || value == null) {
                                return "Please enter Email";
                              } else {
                                model.appUser.userEmail = value;
                              }
                            },
                          ),
                          fixsize10,
                          customTextfeild(
                            onpressed: () {
                              model.showPassword();
                              print(
                                  "someone tap on me ${model.isShowPassword}");
                            },
                            name: "Password",
                            isPassword: model.isShowPassword,
                            state: 2,
                            controller: model.passwordController,
                            valdation: (value) {
                              // ignore: unnecessary_null_comparison
                              if (value!.isEmpty || value == null) {
                                return "Please enter Password";
                              } else {
                                model.appUser.password = value;
                              }
                            },
                          ),
                          fixsize10,
                          fixsize10,
                          fixsize,
                          Custom_button(
                              text: "SIGN IN",
                              onpressed: () {
                                model.userSignIn(context, model.appUser);

                                // Get.to(LocationScreen());
                              }),
                          fixsize10,
                          Center(
                            child: Text_widget(
                              name: "Forgot Password?",
                              text_size: 16,
                            ),
                          ),
                          fixsize,
                          bottom_page(
                            name: "SIGN UP",
                            detail: "Don't have an account so for?",
                            onpressed: () {
                              Get.back();
                            },
                          ),
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
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import '../SignUpScreen/signupProvider.dart';

class GenderSclectionScreen extends StatelessWidget {
  GenderSclectionScreen({Key? key}) : super(key: key);

  @override
  bool isMale = false;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            images.blacklogo,
                            scale: 4,
                          ),
                        ),
                        minmium,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            images.gsScreen,
                            scale: 5.5,
                          ),
                        ),
                        minmium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            images.gsScreen2,
                            scale: 5.5,
                          ),
                        ),
                        fixsize,
                        SizedBox(
                          width: 350.w,
                          child: Text_widget(
                            name: "Find the best service near by",
                            text_size: 25,
                          ),
                        ),
                        Center(
                          child: Text_widget(
                            name: "Browser services for",
                            text_size: 13,
                          ),
                        ),
                        fixsize10,
                        fixsize10,
                        Custom_button(
                            text: "MALE",
                            onpressed: () async {
                              usergender.text = "Male";

                              log("here is gennder ${usergender.text} , ${userName.text}  ,${userEmail.text}    ");
                              await model.assignData();
                              model.printfun();
                              await model.registerUser(context, model.appUser);
                            }),
                        fixsize,
                        fixsize10,
                        Custom_button(
                            text: "FEMALE",
                            onpressed: () async {
                              usergender.text = "Female";

                              log("here is gennder ${usergender.text} , ${userName.text}  ,${userEmail.text}    ");
                              await model.assignData();
                              model.printfun();
                              await model.registerUser(context, model.appUser);
                              // model.clearText();

                              // Get.to(const BottomNavigations());
                            }),
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

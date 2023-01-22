// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessBankDetailScreen/valitition.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessSignUpScreen/BusinessSignUpProvider.dart';

import '../../../Backend/core/Enums/enums.dart';
import '../BusinessFileUploadScreen/BusinessFileUploadScreen.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class BusinessBankDetailScreen extends StatelessWidget {
  BusinessBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessSignUpProvider(),
      child: Consumer<BusinessSignUpProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: lightgrey,
                  body: SingleChildScrollView(
                      child: commonPadding(
                          data: Form(
                    key: model.formkey3,
                    child: Column(
                      children: [
                        Text_widget(
                          name: "Enter Bank details",
                          text_size: 22,
                        ),
                        Text_widget(
                          name: "Get Paid by customers",
                          text_size: 17,
                        ),
                        fixsize,
                        Image.asset(
                          images.card,
                          scale: 3.5,
                        ),
                        fixsize,
                        customTextfeild(
                          name: "Card number",
                          textinputformatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter(),
                          ],
                          keybordtype: TextInputType.number,
                          controller: textFeildata.cardNumber,
                          valdation: (value) {
                            if (value!.isEmpty || value == null) {
                              return "Enter a vaild card";
                            } else {
                              textFeildata.cardNumber;
                              log("${textFeildata.cardNumber.text}");
                            }
                          },
                        ),
                        fixsize,
                        customTextfeild(
                            name: "Card Holder's Name",
                            controller: textFeildata.cardHolderName,
                            valdation: (value) {
                              if (value!.isEmpty || value == null) {
                                return "Please enter name";
                              } else {
                                textFeildata.cardHolderName.text;
                              }
                            }),
                        fixsize,
                        Row(
                          children: [
                            Expanded(
                              child: customTextfeild(
                                controller: textFeildata.cardExp,
                                valdation: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return "Please enter name";
                                  } else {
                                    textFeildata.cardExp.text;
                                  }
                                },
                                textinputformatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(5),
                                  CardMonthInputFormatter(),
                                ],
                                keybordtype: TextInputType.number,
                                name: "Exp. Date",
                              ),
                            ),
                            fixsizewidth10,
                            Expanded(
                              child: customTextfeild(
                                controller: textFeildata.cardCvv,
                                valdation: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return "Please enter CVV";
                                  } else {
                                    textFeildata.cardExp.text;
                                  }
                                },
                                textinputformatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                keybordtype: TextInputType.number,
                                name: "CVV",
                              ),
                            ),
                          ],
                        ),
                        fixsize,
                        fixsize,
                        Custom_button(
                            text: "Next",
                            onpressed: () {
                              if (model.formkey3.currentState!.validate()) {
                                Get.to(BusinessUploadFileScreen());
                              }
                            }),
                      ],
                    ),
                  ))),
                ),
              ));
        },
      ),
    );
  }
}

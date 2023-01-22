import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/authservice.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessBottomNvigation/BusinessBottomNvigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BSigninProvider extends BaseViewModal {
  // final businessEmail =
  //     FirebaseFirestore.instance.collection('BusinessappUser');
  bool isShowPassword = true;
  List<String> busniessEmails = [];
  BusinessAppUser businessappUser = BusinessAppUser();
  final authServices = AuthServices();
  CustomAuthResult customAuthResult = CustomAuthResult();

  final formKey = GlobalKey<FormState>();
  final userEmailController = TextEditingController();
  // final builtNoController = TextEditingController();
  final passwordController = TextEditingController();

  clearTextField() {
    userEmailController.clear();
    passwordController.clear();
  }

  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  BusinessuserSignIn(context, user) async {
    setState(ViewState.busy);
    if (formKey.currentState!.validate()) {
      // await customreEmails();
      // if (customresEmails.contains(userEmailController.text)) {
      customAuthResult = await authServices.BusinessloginUser(user);
      if (customAuthResult.user != null) {
        log("this is business inside ${businessappUser.businessEmail},${businessappUser.password}");
        // await localDataBaseObject.setCustomerLogin(true);

        Get.offAll(const BusinessBottomNavigations());

        clearTextField();
      } else {
        log("business inside  last  error");
        // log("this is business inside ${businessappUser.businessEmail},${businessappUser.password}");
        _showMyDialog(context, customAuthResult.errorMessage);
      }
      // } else {
      // Get.snackbar('Warn',
      // 'you are not loging with Customeremail and check you email or password',
      // backgroundColor: Colors.green);
      // }.

    }
    setState(ViewState.idle);
  }

  // buserSignIn(context, user) async {
  //   setState(ViewState.busy);

  //   log("this is business ${businessappUser.businessEmail},${businessappUser.password}");
  //   // customAuthResult =
  //   await authServices.businesloginUser(user);
  //   sharePrefBusiness();
  //   setState(ViewState.idle);
  //   Get.offAll(const BusinessBottomNavigations());
  //   clearTextField();
  //   if (customAuthResult.user != null) {
  //     log('its not null');
  //   } else {
  //     // _showMyDialog(context, customAuthResult.errorMessage);
  //   }

  //   notifyListeners();
  // }

  void sharePrefBusiness() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isBusinss", true);

    log("hiii this is first enter");
    pref.setBool('firsttime', true);
  }

  Future<void> _showMyDialog(context, String? error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error!),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/authservice.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';
import 'package:service_app/Backend/core/Models/customermodel.dart';
import 'package:service_app/Feature/CustomerProflieScreens/BottomNvigation/BottomNaviagationScreen.dart';

class SigninProvider extends BaseViewModal {
  bool isShowPassword = true;
  // final customerEmailCollection =
  //     FirebaseFirestore.instance.collection('appUser');
  List<String> customresEmails = [];
  AppUser appUser = AppUser();
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

  userSignIn(context, user) async {
    setState(ViewState.busy);
    if (formKey.currentState!.validate()) {
      // await customreEmails();
      // if (customresEmails.contains(userEmailController.text)) {
      customAuthResult = await authServices.loginUser(user);
      if (customAuthResult.user != null) {
        await localDataBaseObject.setCustomerLogin(true);

        Get.offAll(() => const BottomNavigations());

        clearTextField();
      } else {
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

  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
  /////////Get the Customres Emails///////
  ///////////////////////////////////////
  // Future<List> customreEmails() async {
  //   await customerEmailCollection.get().then((value) {
  //     for (int i = 0; i < value.docs.length; i++) {
  //       String emails = value.docs[i]['userEmail'];
  //       customresEmails.add(emails);
  //     }
  //   });
  //   return customresEmails;
  // }

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

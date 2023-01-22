import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';

import '../../Feature/OTPScreen/OTPScreen.dart';
import '../core/Models/basemodel.dart';
import '../core/Models/businessmodel.dart';
import '../core/Models/customermodel.dart';
import 'datastoreService.dart';

class AuthServices extends BaseViewModal {
  final _auth = FirebaseAuth.instance;
  final _databaseServices = DatabaseServices();
  CustomAuthResult customAuthResult = CustomAuthResult();
  User? user;
  bool? isLogin;
  AppUser? appUser;
  BusinessAppUser? businessUser;

  AuthServices() {
    init();
  }

  init() async {
    user = _auth.currentUser;
    if (user != null) {
      isLogin = true;
      appUser = (await _databaseServices.getUser(user!.uid));
    } else {
      isLogin = false;
    }
  }

  ///
  /// Register user
  ///
  Future<CustomAuthResult> userSignUp(AppUser user) async {
    print('@services/singUpWithEmailPassword');
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: user.userEmail!.trim(), password: user.password!);

      /// If user login fails without any exception and error code
      if (credentials.user == null) {
        log("found error error");
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
        return customAuthResult;
      }

      if (credentials.user != null) {
        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
        user.appUserId = credentials.user!.uid;
        // appUser!.userId = credentials.user!.uid.toString();

        log("before the register");
        await _databaseServices.registerAppUser(user);
        print("after register app ");
        log("print after register");

        // localDataBase.setAppUserRecord(islogin: true,userIamgeURL: appUser!.profileimage,useremail: appUser!.userEmail,userid: appUser!.userId, username: appUser!.userName);
        appUser = user;
      }
    } catch (e) {
      print('Exception @sighupWithEmailPassword: $e');
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  Future<CustomAuthResult> businessuserSignUp(BusinessAppUser user) async {
    log('@services/singUpWithEmailPassword/business');
    await _databaseServices.registerBusinessAppUser(user);
    // try {
    //   final credentials = await _auth.createUserWithEmailAndPassword(
    //       email: user.businessEmail!.trim(), password: user.password!);

    //   /// If user login fails without any exception and error code
    //   if (credentials.user == null) {
    //     log("found error error");
    //     customAuthResult.status = false;
    //     customAuthResult.errorMessage = 'An undefined Error happened.';
    //     return customAuthResult;
    //   }

    //   if (credentials.user != null) {
    //     customAuthResult.status = true;
    //     customAuthResult.user = credentials.user;
    //     user.businessUserId = credentials.user!.uid;
    //     // appUser!.userId = credentials.user!.uid.toString();

    //     log("before the register");

    //     print("after register app ");
    //     log("print after register");

    //     // localDataBase.setAppUserRecord(islogin: true,userIamgeURL: appUser!.profileimage,useremail: appUser!.userEmail,userid: appUser!.userId, username: appUser!.userName);
    //     // appUser = user;
    //   }
    // } catch (e) {
    //   print('Exception @sighupWithEmailPassword: $e');
    //   customAuthResult.status = false;
    //   customAuthResult.errorMessage =
    //       AuthExceptionsService.generateExceptionMessage(e);
    // }
    return customAuthResult;
  }

  //////For CustomerUserLOgin //////
  ////////////////////////////////
  loginUser(AppUser appUser) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: appUser.userEmail!, password: appUser.password!);
      if (credentials.user == null) {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
      }

      if (credentials.user != null) {
//
        this.appUser = await _databaseServices.getUser(credentials.user!.uid);

        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
      }
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  BusinessloginUser(BusinessAppUser businessuser) async {
    try {
      // log
      log("business inside 1");
      final credentials = await _auth.signInWithEmailAndPassword(
          email: businessuser.businessEmail!.trim(),
          password: businessuser.password!.trim());
      if (credentials.user == null) {
        log("business inside 2");
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined Error happened.';
      }

      if (credentials.user != null) {
        log("business inside 3 done");
//
        businessUser =
            await _databaseServices.businessgetUser(credentials.user!.uid);
        log("business inside 4");

        customAuthResult.status = true;
        customAuthResult.user = credentials.user;
      }
    } catch (e) {
      log("business inside second last  error");

      customAuthResult.status = false;
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  //////For BusinesUserLOgin //////
  ////////////////////////////////
  // businesloginUser(BusinessAppUser businessAppUser) async {
  //   try {
  //     final credentials = await _auth.signInWithEmailAndPassword(
  //         email: businessAppUser.businessEmail!,
  //         password: businessAppUser.password!);
  //     if (credentials.user == null) {
  //       log('the uid is ${credentials.user!.uid}');
  //       customAuthResult.status = false;
  //       customAuthResult.errorMessage = 'An undefined Error happened.';
  //     }

  //     if (credentials.user != null) {
  //       log('the use is not empty ok');

  //       // this.busz _databaseServices.busniessgGetUser(credentials.user!.uid);

  //       businessUser = (await _databaseServices.busniessgGetUser(user!.uid))!;

  //       Get.off(() => const BusinessBottomNavigations());
  //       // print("in side database service ${this.businessUser!.userName}");
  //       // print("in side database service ${this.businessUser!.userEmail}");
  //       // print("in side database service ${this.businessUser!.appUserId}");
  //       print("in side database service ${this.businessUser!.password}");

  //       customAuthResult.status = true;
  //       customAuthResult.user = credentials.user;
  //     }
  //   } catch (e) {
  //     customAuthResult.status = false;
  //     customAuthResult.errorMessage =
  //         AuthExceptionsService.generateExceptionMessage(e);
  //   }
  //   // return customAuthResult;
  // }

  Future<void> logout({id}) async {
//    if (id != null) FirebaseDatabaseService().updateFcmToken(null, id);
    await _auth.signOut();
    localDataBaseObject.clearlocaldatabase();
  }

  verifyPhoneNumber({
    int state = 1,
    required String phoneNumber,
  }) async {
    setState(ViewState.busy);
    final auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) {
            auth
                .signInWithCredential(credential)
                .then((UserCredential credential) async {});
          },
          verificationFailed: (FirebaseAuthException exception) {
            Get.snackbar('Verification Failed', '${exception.message}',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 60),
                snackPosition: SnackPosition.BOTTOM);
          },
          codeSent: (String verificationId, int) {
            Get.to(() => OTPScreen(
                  state: state == 1 ? 1 : 2,
                  phoneNumber: phoneNumber,
                  verificationId: verificationId,
                ));
          },
          codeAutoRetrievalTimeout: (String ver) {});
      setState(ViewState.idle);
    } catch (e) {
      Get.snackbar('Error', 'OTP Verification Failed',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 30),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }

    // return widget;
  }
}

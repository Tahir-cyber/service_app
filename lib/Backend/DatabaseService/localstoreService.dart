// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

LocalDataBase localDataBaseObject = LocalDataBase();

class LocalDataBase {
  FristEnterset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    log("hiii this is first enter");
    prefs.setBool('firsttime', true);
  }

  customuserSet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('customeruser', true);
  }

  customuserGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? customeuser = prefs.getBool('customeruser');
    return customeuser;
  }

  FirstEnterget() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firsttime = prefs.getBool('firsttime');
    return firsttime;
  }

  //check login

  iscustomerloginGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isCustomerlogin');
  }

  usBusinessloginGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isBusinesslogin');
  }

  removeuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("isLogin");
  }

  clearlocaldatabase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("clear all database");
    prefs.clear();
  }

  //appusers

  setAppUserRecord({
    String? username,
    String? userIamgeURL,
    String? userid,
    String? useremail,
    bool? isCustomerlogin,
    bool? isBusinesslogin,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userid', userid!);
    prefs.setString('userImageURL', userIamgeURL ?? "");
    prefs.setBool('isCustomerlogin', isCustomerlogin!);
    prefs.setBool('isBusinesslogin', isBusinesslogin!);
    prefs.setString('useremail', useremail ?? "");
    prefs.setString('username', username!);
  }

  setCustomerLogin(isCustomerlogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isCustomerlogin', isCustomerlogin!);
  }

  //
  getUserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('userid');
    return userID;
  }

  // Future<String?> getUserName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userName = prefs.getString('username');
  //   return userName;
  // }

  // Future<String?> getUserImageURL() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userImageURL = prefs.getString('userImageURL');
  //   return userImageURL;
  // }

  // getUserEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userEmail = prefs.getString('useremail');
  //   return userEmail;
  // }
}

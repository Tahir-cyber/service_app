import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessBottomNvigation/BusinessBottomNvigation.dart';
import 'package:service_app/Feature/CustomerProflieScreens/BottomNvigation/BottomNaviagationScreen.dart';
import 'package:service_app/Feature/ServiceScreen/ServiceScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    // localDataBaseObject.clearlocaldatabase();
    Future.delayed(const Duration(seconds: 3), () async {
      // AuthServices user = AuthServices();

      var firsttime = await localDataBaseObject.FirstEnterget();
      var iscustomerlogin = await localDataBaseObject.iscustomerloginGet();
      var isbusinesslogin = await localDataBaseObject.iscustomerloginGet();
      var iscustomeruser = await localDataBaseObject.customuserGet();

      SharedPreferences pref = await SharedPreferences.getInstance();
      bool checkBsuinesIslogin = pref.getBool("isBusinss") ?? false;

      log("this is first time firsttime $firsttime");
      log("this is first time iscustomeruser  $iscustomeruser");
      log("this is first time checkBsuinesIslogin  $checkBsuinesIslogin");
      log("this is first time isCstomerLogin $iscustomerlogin");

      if (firsttime == true) {
        if (iscustomeruser == true) {
          if (iscustomerlogin == true) {
            print("enter to the BottomNavigations");
            Get.to(() => BottomNavigations());
          } else {
            if (checkBsuinesIslogin == true) {
              print("enter to the BusinessBottomNavigations");

              Get.off(() => BusinessBottomNavigations());
            } else {
              print("enter to the ServiceScreen");

              Get.off(() => ServiceScreen());
            }
          }
        }
        //this line will be removed
        Get.off(() => ServiceScreen());
      } else {
        log("this is value $iscustomeruser");
        Get.off(() => ServiceScreen());
      }

      // log(checkBsuinesIslogin.toString());
      // if (checkBsuinesIslogin == true) {
      //   Get.to(() => BusinessBottomNavigations());
      // } else {
      //   Get.to(() => ServiceScreen());
      // }
    });
    super.didChangeDependencies();
  }

  @override
  // void initState() {
  //   didChangeDependencies();
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: baseColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(images.background2)),
          ),
          child: Center(
            child: Image.asset(
              images.background,
              scale: 4,
            ),
          ),
        ));
  }
}

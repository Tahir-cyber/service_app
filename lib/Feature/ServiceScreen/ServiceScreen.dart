import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/BusinessProfileScreens/SignInScreenBusiness/SignInScreenbusiness.dart';
import 'package:service_app/Feature/CustomerProflieScreens/OnbordingScreen/OnbordingScreen.dart';
import '../../Core/commonMethod.dart';
import '../../Core/common_widgets.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(images.serviceimage), fit: BoxFit.fill),
      ),
      child: Container(
        color: Colors.black38,
        height: 1.sh,
        width: 1.sw,
        child: commonPadding(
          data: Column(children: [
            Spacer(),
            Column(
              children: [
                Text_widget(
                  name: "Get Service Providers",
                  Text_color: white,
                  state: 2,
                  text_size: 20,
                ),
                tarsparentButton(
                    onpressed: () async {
                      await localDataBaseObject.FristEnterset();
                      Get.to(() => OnBoadingScreenMain());
                    },
                    name: "CUSTOMER"),
              ],
            ),
            Spacer(),
            Spacer(),
            Column(
              children: [
                Text_widget(
                  name: "Business owner",
                  Text_color: white,
                  state: 2,
                  text_size: 20,
                ),
                tarsparentButton(
                    onpressed: () async {
                      await localDataBaseObject.customuserSet();

                      Get.to(() => BusinessSignInScreen());
                      // Get.to(BusinessAddServiceScreen());
                      // Get.to(BusinessUploadFileScreen());
                    },
                    name: "SERVICE PROVIDERS"),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}

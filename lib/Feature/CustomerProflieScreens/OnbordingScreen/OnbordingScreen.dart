import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Core/common_var.dart';
import '../SignUpScreen/SignUpScreen.dart';
import 'onbordingWidget.dart';

class OnBoadingScreenMain extends StatefulWidget {
  const OnBoadingScreenMain({Key? key}) : super(key: key);

  @override
  State<OnBoadingScreenMain> createState() => _OnBoadingScreenMainState();
}

class _OnBoadingScreenMainState extends State<OnBoadingScreenMain> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 620,
              child: PageView(
                controller: controller,
                children: [
                  OnbordingData(
                    name: "Find near by services",
                    iamgeData: images.onbording,
                  ),
                  OnbordingData(
                    name: "Locate Near By Dentists",
                    iamgeData: images.onbording1,
                  ),
                  OnbordingData(
                    name: "Hotels and Food services",
                    iamgeData: images.onbording2,
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              onDotClicked: (index) {
                controller.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              count: 3,
              controller: controller,
              effect: ExpandingDotsEffect(
                  spacing: 8,
                  dotWidth: 13,
                  dotHeight: 13,
                  dotColor: Colors.black,
                  activeDotColor: baseColor,
                  expansionFactor: 2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Custom_button(
                  text: "GET STARTED",
                  onpressed: () async {
                    await localDataBaseObject.customuserSet();
                    Get.to(() => SignupScreen());
                  }),
            ),
            fixsize,
            Text_widget(
              name: "Are you a service provider?",
              text_size: 20,
            ),
            minmium,
            InkWell(
              onTap: () {},
              child: Text(
                "Start Here",
                style: GoogleFonts.averageSans(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  color: baseColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
 
*/

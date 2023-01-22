import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/HomScreen/homeModel.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/UserDrawar/UserDrawar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const UserDrawar(),
      backgroundColor: white,
      body: Screenlayout_widget(
        appbarData: appbar(
          onpressed: () {
            log("click");

            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        paddingstate: 2,
        screendata: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
          child: Column(children: [
            Searchbar(),
            Expanded(
                child: GridView.builder(
              itemCount: all_Data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14.0,
                  mainAxisSpacing: 14.0),
              itemBuilder: (BuildContext context, int index) {
                var data = all_Data[index];
                return InkWell(
                    onTap: () {
                      // log('this is you want ${items[index]}');
                      // Get.to(data.screenRoute);
                      Get.to(() => MapScreen(categoryName: items[index]));

                      // print("hii");
                    },
                    child: Image.asset(data.imagePath!));
              },
            )),
          ]),
        ),
      ),
    );
  }
}

// Row appbar({state = 1, final String? data, Function()? onpressed}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       InkWell(
//         onTap: onpressed,
//         child: Image.asset(
//           images.drawar,
//           scale: 3.5,
//         ),
//       ),
//       state == 1
//           ? Image.asset(
//               images.whitelogo_,
//               scale: 4,
//             )
//           : Text_widget(
//               name: data!,
//               text_size: 19,
//               state: 2,
//               Text_color: white,
//             ),
//       // Image.asset(images.),

//       InkWell(
//         onTap: () {
//           // Get.to(const BusinessProfile());
//         },
//         child: CircleAvatar(
//           radius: 15.r,
//           backgroundImage: NetworkImage(activeuser.profileImage.toString()),
//         ),
//       ),
//     ],
//   );
// }

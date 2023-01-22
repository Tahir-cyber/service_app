import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';

import '../Backend/DatabaseService/datastoreService.dart';
import 'appColors.dart';
import 'classesInstance.dart';
import 'common_widgets.dart';

InkWell tarsparentButton(
    {required Function() onpressed, required String name, int state = 1}) {
  return InkWell(
    onTap: onpressed,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: state == 1
              ? white
              : state == 3
                  ? baseColor
                  : black,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text_widget(
            name: name,
            text_size: 18,
            Text_color: state == 1
                ? white
                : state == 3
                    ? baseColor
                    : black,
            state: 2,
          ),
          Image.asset(
            images.serviceimage2,
            scale: 2.5,
          ),
        ],
      ),
    ),
  );
}

Container Searchbar({TextEditingController? controller, String? name}) {
  return Container(
      height: 43.h,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: lightgrey3,
        borderRadius: BorderRadius.circular(52.r),
      ),
      child: TextFormField(
        controller: controller,
        // validator: valdation!,
        cursorColor: lightgrey3,
        decoration: InputDecoration(
            prefixIcon: IconButton(
                icon: Icon(
                  color: baseColor2,
                  Icons.search,
                ),
                onPressed: () {}),
            // contentPadding:
            //     EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: name ?? "Search",
            hintStyle: GoogleFonts.averageSans()),
      ));
}

Column appbar_one({String? Screenname, state = 1, Widget? data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      state == 1
          ? backButton(state: 2)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(state: 2),
                data!,
              ],
            ),
      Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Text_widget(
          name: Screenname ?? "AppBar",
          text_size: 20,
          state: 2,
          Text_color: white,
        ),
      )
    ],
  );
}

SizedBox custom_divider({double? indent, double? endent, state = 1}) {
  return SizedBox(
    child: Divider(
      color: state == 3 ? Colors.grey[600] : black,
      height: 2,
      thickness: 1,
      indent: state == 2 ? indent!.w : 10,
      endIndent: state == 2 ? endent!.w : 10,
    ),
  );
}

Row appbar({state = 1, final String? data, Function()? onpressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: onpressed,
        child: Image.asset(
          images.drawar,
          scale: 3.5,
        ),
      ),
      state == 1
          ? Image.asset(
              images.whitelogo_,
              scale: 4,
            )
          : Text_widget(
              name: data!,
              text_size: 19,
              state: 2,
              Text_color: white,
            ),
      // Image.asset(images.),

      InkWell(
        onTap: () {
          // Get.to(const BusinessProfile());
        },
        child: CircleAvatar(
          radius: 15.r,
          backgroundImage: NetworkImage(activeuser.profileImage.toString()),
        ),
      ),
    ],
  );
}

popUpMessage({String? title, String? message, Color? color, textcolor}) {
  Get.snackbar(title!, message!,
      backgroundColor: color ?? baseColor, colorText: color ?? white);
}


// class customwidgetProvider extends BaseViewModal {
//   Row appbar({state = 1, final String? data, Function()? onpressed}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: onpressed,
//           child: Image.asset(
//             images.drawar,
//             scale: 3.5,
//           ),
//         ),
//         state == 1
//             ? Image.asset(
//                 images.whitelogo_,
//                 scale: 4,
//               )
//             : Text_widget(
//                 name: data!,
//                 text_size: 19,
//                 state: 2,
//                 Text_color: white,
//               ),
//         // Image.asset(images.),

//         InkWell(
//           onTap: () {
//             // Get.to(const BusinessProfile());
//           },
//           child: CircleAvatar(
//             radius: 15.r,
//             backgroundImage: NetworkImage(activeuser.profileImage.toString()),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   notifyListeners();
// }

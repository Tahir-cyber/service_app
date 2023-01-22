import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/UserProfileScreen/UserProfileScreen.dart';

class EditBusinessProfile extends StatelessWidget {
  const EditBusinessProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? id;
    final employee = FirebaseFirestore.instance.collection("employee");
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 240.h,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 230,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      images.onbording,
                                    ),
                                    fit: BoxFit.cover),
                                color: black,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50.r),
                                    bottomLeft: Radius.circular(50.r))),
                            child: Column(
                              children: [
                                fixsize,
                                fixsize,
                                Image.asset(
                                  images.upload,
                                  scale: 2,
                                ),
                                Text_widget(
                                  name: "Update Background Banner/Video",
                                  text_size: 12,
                                  state: 2,
                                  Text_color: white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(ShopProfileDetailsScreen());
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            backgroundColor: white,
                            radius: 75.r,
                            child: CircleAvatar(
                              radius: 70.r,
                              backgroundImage: AssetImage(images.profile2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    size: 40.0.sp,
                                  ),
                                  Text_widget(
                                    name: "Update Logo",
                                    text_size: 12,
                                    state: 2,
                                    Text_color: white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      backButton(state: 2),
                    ],
                  ),
                ),
                commonPadding(
                  data: Column(
                    children: [
                      fixsize,
                      customTextfeild(name: "Service Category"),
                      fixsize,
                      customTextfeild(name: "Business Reg. No."),
                      fixsize,
                      customTextfeild(name: "Business Phone number"),
                      fixsize,
                      customTextfeild(name: "Business Email"),
                      fixsize,
                      customTextfeild(name: "Business Website"),
                      fixsize,
                      customTextfeild(
                          name: "Business Details", text_feid_height: true),
                      fixsize,

                      // SizedBox(
                      //   height: 90.h,
                      //   child: Consumer<EditBusinessProfileProvider>(
                      //     builder: (context, value, child) {
                      //       return ListView.builder(
                      //           scrollDirection: Axis.horizontal,
                      //           shrinkWrap: true,
                      //           physics: const ClampingScrollPhysics(),
                      //           itemCount: value.employlist.length,
                      //           itemBuilder: ((context, index) {
                      //             return Column(
                      //               children: [
                      //                 Container(
                      //                   margin: EdgeInsets.only(
                      //                       top: 8.h, left: 10.w),
                      //                   height: 70.h,
                      //                   width: 60.w,
                      //                   decoration: const BoxDecoration(
                      //                       // color: Colors.green,
                      //                       ),
                      //                   child: ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(50.r),
                      //                     child: Consumer<
                      //                         EditBusinessProfileProvider>(
                      //                       builder: (context, value, child) {
                      //                         return InkWell(
                      //                             onTap: () async {
                      //                               log('this is  cirrent id ${value.employlist[index].id}');
                      //                               //value.GetAllServices();
                      //                             },
                      //                             child: Image(
                      //                               image: NetworkImage(value
                      //                                   .employlist[index]
                      //                                   .imageUrl!),
                      //                             ));
                      //                       },
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Center(
                      //                   child: Padding(
                      //                     padding: EdgeInsets.only(left: 9.w),
                      //                     child: Text(
                      //                       value.employlist[index].name!,
                      //                       style: TextStyle(
                      //                         fontSize: 09.sp,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             );
                      //           }));
                      //     },
                      //   ),
                      // ),

                      fixsize,
                      Custom_button(text: "Update Profile", onpressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Row appbar({state = 1, final String? data}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        images.drawar,
        scale: 3.5,
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
          Get.to(const UserProfileScreen());
        },
        child: CircleAvatar(
          radius: 15.r,
          backgroundImage: AssetImage(images.profile),
        ),
      ),
    ],
  );
}

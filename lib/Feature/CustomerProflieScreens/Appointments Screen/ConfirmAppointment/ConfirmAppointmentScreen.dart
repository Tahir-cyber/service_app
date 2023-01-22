import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/Helping_plugins_widgets/clander.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/ConfirmAppointment/ComfirmAppointmentDetails.dart';

import '../../../BusinessProfileScreens/EditBusinessProfile/edit_business_profile_provider.dart';
import '../../ShopDetailScreen.dart/Shopdetaildata.dart';

class ConfirmAppointScreen extends StatefulWidget {
  const ConfirmAppointScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmAppointScreen> createState() => _ConfirmAppointScreenState();
}

class _ConfirmAppointScreenState extends State<ConfirmAppointScreen> {
  int number = 30;
  int? selectedAvatarIndex;

  final employee = FirebaseFirestore.instance.collection('employee');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Screenlayout_widget(
        // paddingstate: 2,
        screendata: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(images.profile2),
                title: Text_widget(
                  state: 2,
                  name: "John Doe Barber's Shop",
                  text_size: 16,
                ),
                subtitle: Text_widget(
                  state: 2,
                  name: "Hairdress + Beautician ",
                  text_size: 12,
                ),
              ),
              fixsize10,
              // ignore: todo
              // TODO: This is the listview
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('employee')
                            .snapshots(),
                        builder:
                            ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          return snapshot.hasData
                              ? SizedBox(
                                  height: 90.h,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedAvatarIndex = null;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      selectedAvatarIndex ==
                                                              null
                                                          ? lightgrey4
                                                          : lightgrey3,
                                                  radius: 30.r,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 30.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                selectedAvatarIndex == null
                                                    ? Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: 25.sp,
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              "Anyone",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: ((context, index) {
                                            final DocumentSnapshot
                                                documentSnapshot =
                                                snapshot.data!.docs[index];
                                            var id =
                                                snapshot.data!.docs[index].id;
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: Column(
                                                children: [
                                                  Consumer<
                                                      EditBusinessProfileProvider>(
                                                    builder: (context, value,
                                                        child) {
                                                      return InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedAvatarIndex =
                                                                index;
                                                          });
                                                        },
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 30.r,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      documentSnapshot[
                                                                          'image']),
                                                            ),
                                                            selectedAvatarIndex ==
                                                                    index
                                                                ? Icon(
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 25.sp,
                                                                  )
                                                                : const SizedBox(),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Text(
                                                    documentSnapshot['name'],
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })),
                                    ],
                                  ),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.green,
                                );
                        })),
                  ],
                ),
              ),
              fixsize10,
              Text_widget(
                state: 2,
                name: "Service List",
                text_size: 17,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ServiceData(serivceName: "Man's New Haircut");
                  }),
              custom_Card(
                  state: 2,
                  radius: 10.r,
                  data: SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text_widget(
                        name: "Add More Services",
                        text_size: 17,
                        state: 2,
                        Text_color: baseColor,
                      ),
                    ),
                  )),
              minmium,
              Text_widget(
                state: 2,
                name: "Select Date & Time",
                text_size: 17,
              ),
              SizedBox(
                height: 170.h,
                child: custom_Card(
                  state: 2,
                  radius: 15.r,
                  data: SizedBox(
                    height: 114.h,
                    width: double.infinity,
                    child: TableBasicsExample(),
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
                child: custom_Card(
                    data: GridView.builder(
                        shrinkWrap: true,
                        itemCount: all_time.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.9,
                                crossAxisSpacing: 14.0,
                                mainAxisSpacing: 14.0),
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                number = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      index == number ? baseColor : lightgrey,
                                  borderRadius: BorderRadius.circular(14.r)),
                              // height: 23,
                              // width: 63,

                              child: Text_widget(
                                name: all_time[index],
                                text_size: 12,
                                state: 2,
                                Text_color: index == number ? white : black,
                              ),
                            ),
                          );
                        })),
              ),
              fixsize,
              const DottedLine(),
              fixsize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text_widget(
                    state: 2,
                    name: "Total",
                    text_size: 20,
                  ),
                  fixsize10,
                  Text_widget(
                    state: 2,
                    name: "\$70",
                    text_size: 20,
                  ),
                ],
              ),
              fixsize10,
              Text_widget(
                state: 2,
                name: "Payment method",
                text_size: 20,
              ),
              fixsize10,
              Custom_button(text: "CONFIRM", onpressed: () {}),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
        //   child: Column(children: [
        //     Searchbar(),
        //     Expanded(
        //         child: GridView.builder(
        //       itemCount: all_Data.length,
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3,
        //           crossAxisSpacing: 14.0,
        //           mainAxisSpacing: 14.0),
        //       itemBuilder: (BuildContext context, int index) {
        //         var data = all_Data[index];
        //         return InkWell(
        //             onTap: () {
        //               Get.to(data.screenRoute);
        //               print("hii");
        //             },
        //             child: Image.asset(data.imagePath!));
        //       },
        //     )),
        //   ]),
        // ),
        state: 2,
        height: 113.h,
        appbarData: appbar_one(Screenname: "Confirm Appointment"),
      ),
    );
  }
}

DottedLine dottedLine() {
  return const DottedLine(
    direction: Axis.horizontal,
    lineLength: double.infinity,
    lineThickness: 1.0,
    dashLength: 24.0,
    dashColor: Colors.black,
    // dashGradient: [Colors.red, Colors.blue],
    dashRadius: 0.0,
    dashGapLength: 8.0,
    // dashGapColor: Colors.transparent,
    // dashGapGradient: [Colors.red, Colors.blue],
    dashGapRadius: 0.0,
  );
}

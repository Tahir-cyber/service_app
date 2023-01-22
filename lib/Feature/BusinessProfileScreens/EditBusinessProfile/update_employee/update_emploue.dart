import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Core/imagepath.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/update_employee/update_provider.dart';

class UpdateEmployee extends StatelessWidget {
  final String? id;
  const UpdateEmployee({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final images = Images();
    TextEditingController nameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("UPDATE EMPLOYEE"),
        backgroundColor: Colors.green,
        //delete button
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete"),
                        content: const Text("Are you sure you want to delete?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("No")),
                          TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('employee')
                                    .doc(id)
                                    .delete();
                                Get.back();
                                Get.back();
                              },
                              child: const Text("Yes")),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Consumer<UpdateEmployeeProvider>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
            child: Column(children: [
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('employee')
                      .doc(id)
                      .get(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return const Text("No data");
                    }
                    return CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.green,
                      backgroundImage: value.imgeFile == null
                          ? NetworkImage(snapshot.data!.get('image'))
                          : FileImage(File(value.imgeFile!.path))
                              as ImageProvider,
                    );
                  }),

              // SizedBox(
              //   height: 90.h,
              //   width: 100.w,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(40.r),
              //     child: Consumer<UpdateEmployeeProvider>(
              //       builder: (context, value, child) => Image(
              //         image: value.imgeFile == null
              //             ? AssetImage(images.profile4)
              //             : FileImage(File(value.imgeFile!.path))
              //                 as ImageProvider,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              fixsize,
              Custom_button(
                  text: 'upload Picture',
                  onpressed: () {
                    value.uploadImage(context);
                  }),
              fixsize,
              customTextfeild(
                controller: nameController,
                name: "Please enter the employee name",
              ),
              fixsize,
              Custom_button(
                  text: 'Update ALl',
                  onpressed: () async {
                    await value.updateEmployee(nameController.text, id);
                    Get.back();
                  }),
            ]),
          );
        },
      ),
    ));
  }
}

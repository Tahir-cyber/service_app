// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/common_widgets.dart';

class BusinessAddServicesProvider extends ChangeNotifier {
  TextEditingController addEmpoyeeController = TextEditingController();
  final employee = FirebaseFirestore.instance.collection('employee');
  List employeeList = [];

  String name = "Add Employee";
  TextEditingController nameController = TextEditingController();
  File? _imageFile;
  File? get imgeFile => _imageFile;
  final ImagePicker _picker = ImagePicker();
  void picImage(ImageSource source) async {
    try {
      final image = await _picker.pickImage(
        source: source,
        imageQuality: 1,
      );
      _imageFile = File(image!.path);
    } catch (e) {
      // print("this is the error of the image " + e.toString());
    }
    notifyListeners();
  }

  addDataToList({required String name, required String image}) {
    employeeList.add(AddEmploy(name: name, image: image));
    notifyListeners();
  }

  void uploadImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.black),
                title: const Text('Photo'),
                onTap: () async {
                  picImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.browse_gallery_outlined,
                    color: Colors.black),
                title: const Text('Gallery'),
                onTap: () async {
                  picImage(
                    ImageSource.gallery,
                  );
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: Container(
                    margin: EdgeInsets.only(right: 200.w),
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: TextField(
                        controller: nameController,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: 'Subject'),
                      ),
                    ),
                  ),
                  onTap: () async {
                    print(nameController.text);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
    notifyListeners();
  }

  // void openPromptSelector(
  //   BuildContext context,
  // ) {
  //   showMaterialModalBottomSheet(
  //     context: context,
  //     expand: false,
  //     builder: (context) {
  //       return StatefulBuilder(
  //         builder: (context, setDialogState) {
  //           return SizedBox(
  //             height: 300.h,
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 10.w),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Add Employee Name and Pic",
  //                     style: TextStyle(
  //                         fontSize: 18.sp, fontWeight: FontWeight.bold),
  //                   ),
  //                   TextField(
  //                     controller: addEmpoyeeController,
  //                     decoration:
  //                         InputDecoration(hintText: "Enter Employee name"),
  //                   ),
  //                   SizedBox(height: 10.h),
  //                   Center(
  //                     child: Column(
  //                       children: [
  //                         InkWell(
  //                             onTap: () {
  //                               setDialogState(() {
  //                                 uploadImage(context);
  //                               });
  //                             },
  //                             child: _imageFile != null
  //                                 ? CircleAvatar(
  //                                     radius: 25.r,
  //                                     backgroundImage: FileImage(_imageFile!),
  //                                   )
  //                                 : CircleAvatar(
  //                                     radius: 25.r,
  //                                     backgroundColor: lightgrey5,
  //                                     child: Icon(
  //                                       Icons.add,
  //                                       color: white,
  //                                     ))),
  //                         SizedBox(height: 5.h),
  //                         Text("Add Image")
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: 30.h),
  //                   Custom_button(
  //                     text: "ADD EMPLOYEE",
  //                     onpressed: () {},
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  void getNameAndImageBottomSheet(BuildContext context) {
    Get.bottomSheet(StatefulBuilder(builder: (context, setter) {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      return Consumer<BusinessAddServicesProvider>(
          builder: (context, value, child) {
        return SizedBox(
          height: 300.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Employee Name and Pic",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("Name cannot be Empty".tr);
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid name(Min. 3 Character)".tr);
                      }
                      return null;
                    },
                    controller: addEmpoyeeController,
                    decoration:
                        InputDecoration(hintText: "Enter Employee name"),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              uploadImage(context);
                            },
                            child: value._imageFile != null
                                ? CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage:
                                        FileImage(value._imageFile!),
                                  )
                                : CircleAvatar(
                                    radius: 25.r,
                                    backgroundColor: lightgrey5,
                                    child: Icon(
                                      Icons.add,
                                      color: white,
                                    ))),
                        SizedBox(height: 5.h),
                        Text("Add Image")
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Custom_button(
                    text: "ADD EMPLOYEE",
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        if (_imageFile != null) {
                          value.addDataToList(
                            name: addEmpoyeeController.text,
                            image: _imageFile!.path,
                          );

                          log("employeeList.length ${employeeList.length}");
                          Get.back();
                        } else {
                          Get.snackbar("title", "Add image",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
    }), backgroundColor: white);

    notifyListeners();
  }

  void addEmployee() async {
    notifyListeners();
    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('employeeimages/')
        .child(DateTime.now().microsecondsSinceEpoch.toString());
    uploadTask = ref.putFile(_imageFile!);
    await uploadTask.whenComplete(() => debugPrint("The picture is upload"));

    String? imageUrl = await ref.getDownloadURL();
    log(imageUrl);
    await employee.add({"name": nameController.text, "image": imageUrl});
    name = "Add Employee";
    _imageFile = null;
    notifyListeners();
  }
}

class AddEmploy {
  final String name;
  final String image;
  AddEmploy({required this.name, required this.image});
}

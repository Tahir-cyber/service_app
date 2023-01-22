// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/update_employee/update_emploue.dart';
import 'package:service_app/Feature/BusinessProfileScreens/EditBusinessProfile/update_employee/update_provider.dart';

class EditBusinessProfileProvider extends ChangeNotifier {
  final employee = FirebaseFirestore.instance.collection('employee');

  void employeeUpdate(String id) {
    log(id);
    Get.to(() => UpdateEmployee(id: id));

    notifyListeners();
  }
}

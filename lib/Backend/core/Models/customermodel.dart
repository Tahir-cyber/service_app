import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  String? appUserId;
  String? userName;
  String? profileImage;
  String? userEmail;
  String? userLocation;
  String? phoneNumber;
  String? password;
  String? longitude;
  String? latitude;
  String? gender;

  // bool? isFirstLogin;

  AppUser({
    this.appUserId,
    this.profileImage,
    this.userEmail,
    this.userName,
    this.userLocation,
    this.phoneNumber,
    this.password,
    this.latitude,
    this.longitude,
    this.gender,
  });

  AppUser.fromJson(json, id) {
    appUserId = id;
    profileImage = json['profileImage'];
    gender = json['gender'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userName = json['userName'] ?? '';
    userEmail = json['userEmail'];
    userLocation = json['userLocation'];
    password = json['password'];
    phoneNumber = json['phoneNumber'] ?? '';
  }
  toJson() {
    return {
      'gender': gender,
      'appUserId': appUserId,
      'profileImage': profileImage,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
      'password': password,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

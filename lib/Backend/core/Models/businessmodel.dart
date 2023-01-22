import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessAppUser extends ChangeNotifier {
  String? businessUserId;
  String? serviceCategory;
  String? businessprofileImage;
  String? businessEmail;
  String? businessWebsite;
  String? businessDetails;
  String? businessPhoneNumber;
  String? password;
  String? longitude;
  String? latitude;
  String? serviceFor;
  String? businessRegNo;
  String? noOfEmplyees;
  String? businessBackgroundImage;
  String? firstServiceName;
  String? serviceTime;
  String? servicePrice;
  String? serviceDiscount;
  List<dynamic>? selectedServiceDays;
  List<dynamic>? listOfBusinessDoc;
  String? businessCard;
  String? cardHolderName;
  String? cardExpDate;
  String? cardCvv;

  // bool? isFirstLogin;

  BusinessAppUser({
    this.cardCvv,
    this.businessCard,
    this.cardHolderName,
    this.cardExpDate,
    this.listOfBusinessDoc,
    this.businessRegNo,
    this.businessUserId,
    this.businessDetails,
    this.serviceCategory,
    this.serviceFor,
    this.businessPhoneNumber,
    this.password,
    this.latitude,
    this.noOfEmplyees,
    this.longitude,
    this.businessEmail,
    this.businessWebsite,
    this.businessprofileImage,
    this.businessBackgroundImage,
    this.firstServiceName,
    this.serviceTime,
    this.servicePrice,
    this.serviceDiscount,
    this.selectedServiceDays,
  });
  BusinessAppUser.fromJson(json, id) {
    cardCvv = json["cardCvv"] ?? "";
    businessCard = json["businessCard"] ?? "";
    cardHolderName = json["cardHolderName"] ?? "";
    cardExpDate = json["cardExpDate"] ?? "";
    businessUserId = id ?? "";
    listOfBusinessDoc = json['listOfBusinessDoc'] ?? "";
    businessRegNo = json['businessRegNo'] ?? "";
    businessDetails = json['businessDetails'] ?? "";
    serviceCategory = json['serviceCategory'] ?? "";
    serviceFor = json['serviceFor'] ?? "";
    businessPhoneNumber = json['businessPhoneNumber'] ?? "";
    password = json['password'] ?? "";
    latitude = json['latitude'] ?? "";
    longitude = json['longitude'] ?? "";
    businessEmail = json['businessEmail'] ?? "";
    businessWebsite = json['businessWebsite'] ?? "";
    businessprofileImage = json['businessprofileImage'] ?? "";
    noOfEmplyees = json['noOfEmplyees'] ?? "";
    businessBackgroundImage = json['businessBackgroundImage'] ?? "";
    firstServiceName = json['firstServiceName'] ?? "";
    serviceTime = json['serviceTime'] ?? "";
    servicePrice = json['servicePrice'] ?? "";
    serviceDiscount = json['serviceDiscount'] ?? "";
    selectedServiceDays = json['selectedServiceDays'] ?? "";
  }

  // BusinessAppUser.fromJson(json, id) {
  //   log("this is the inner id $id");
  //   log("this is the inner json $json");
  //   // log(businessCard.toString());
  //   businessUserId = id ?? "";
  //   listOfBusinessDoc = json['listOfBusinessDoc'] ?? "";
  //   businessCard = json['businessCard'] ?? "";
  //   cardCvv = json['cardCvv'];
  //   cardExpDate = json['cardExpDate'];
  //   cardHolderName = json['cardHolderName'];
  //   businessRegNo = json['businessRegNo'];
  //   businessDetails = json['businessDetails'];
  //   businessWebsite = json['businessWebsite'] ?? "";
  //   businessprofileImage = json['businessprofileImage'] ?? "";
  //   serviceFor = json['serviceFor'] ?? "";
  //   noOfEmplyees = json['noOfEmplyees'] ?? "";
  //   latitude = json['latitude'] ?? "";
  //   longitude = json['longitude'] ?? "";
  //   serviceCategory = json['serviceCategory'] ?? "";
  //   businessEmail = json['businessEmail'] ?? "";
  //   password = json['password'] ?? "";
  //   businessPhoneNumber = json['businessPhoneNumber'] ?? "";
  //   businessBackgroundImage = json['businessBackgroundImage'] ?? "";
  //   firstServiceName = json["firstServiceName"] ?? "";
  //   serviceTime = json['serviceTime'] ?? "";
  //   servicePrice = json['servicePrice'] ?? "";
  //   serviceDiscount = json['serviceDiscount'] ?? "no discount";
  //   selectedServiceDays = json[selectedServiceDays] ?? "";
  // }

  toJson() {
    log('app is the best');
    log("$cardCvv");
    log("$cardExpDate");
    log("$businessCard");
    log("$businessRegNo");
    return {
      'cardCvv': cardCvv,
      "cardExpDate": cardExpDate,
      "cardHolderName": cardHolderName,
      "businessCard": businessCard,
      'listOfBusinessDoc': listOfBusinessDoc,
      'serviceCategory': serviceCategory,
      'businessRegNo': businessRegNo,
      'businessDetails': businessDetails,
      'businessWebsite': businessWebsite,
      'noOfEmplyees': noOfEmplyees,
      'serviceFor': serviceFor,
      'businessBackgroundImage': businessBackgroundImage,
      'businessUserId': businessUserId,
      'businessprofileImage': businessprofileImage,
      'businessEmail': businessEmail,
      'businessPhoneNumber': businessPhoneNumber,
      'password': password,
      'latitude': latitude,
      'longitude': longitude,
      'firstServiceName': firstServiceName,
      'serviceTime': serviceTime,
      'servicePrice': servicePrice,
      'serviceDiscount': serviceDiscount,
      'selectedServiceDays': selectedServiceDays,

      //  this.firstServiceName,
      // this.serviceTime,
      // this.servicePrice,
      // this.serviceDiscount,
      // this.selectedServiceDays,
    };
  }

  notifyListeners();
}

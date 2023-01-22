import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';

import '../../../Backend/DatabaseService/authservice.dart';
import '../../../Backend/core/Enums/enums.dart';
import '../../../Backend/core/Models/basemodel.dart';
import '../SelectDutyDaysScreen/SelectDutyDaysScreen.dart';

TextEditingController serviceFor = TextEditingController();
TextEditingController businessuserEmail = TextEditingController();
TextEditingController businessuserDetails = TextEditingController();
TextEditingController businessuserRegNo = TextEditingController();
TextEditingController businessuserWebsite = TextEditingController();
TextEditingController businessuserPhonenumber = TextEditingController();
TextEditingController businessuserPassword = TextEditingController();
TextEditingController businessuserprofileimage = TextEditingController();
TextEditingController businessuserBackgroundimage = TextEditingController();
TextEditingController businessuserlatitude = TextEditingController();
TextEditingController businessuserlongitude = TextEditingController();
TextEditingController noOfEmployees = TextEditingController();
TextEditingController serviceCategory = TextEditingController();

class TextFeildata {
  TextEditingController serviceName = TextEditingController();
  TextEditingController serviceTime = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  TextEditingController servicediscount = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cardExp = TextEditingController();
  TextEditingController cardCvv = TextEditingController();
  List<String> SelectDays = [];
  List<String> SelectDoc = [];
}

String? selectedValue;
String? selectedValue2;
String? selectedValue3;
TextFeildata textFeildata = TextFeildata();

class BusinessSignUpProvider extends BaseViewModal {
  CustomAuthResult customAuthResult = CustomAuthResult();
  String? imageurl;
  String? imagebackgroundurl;
  bool ischeck = false;
  File? imagedata;

  String? docFile;
  List<String?>? docFileList;
  List<String> docurlList = [];
  List<String> imageMBsize = [];
  String? docFileUrl;
  File? imagedata2;
  late Position position;
  late List<Placemark> placemark;
  String address = '';
  bool serviceEnabled = false;

  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();

  final FirebaseStorage storage = FirebaseStorage.instance;
  BusinessAppUser businessUser = BusinessAppUser();
  final authServices = AuthServices();

  assignData() {
    businessUser.serviceCategory = serviceCategory.text;
    businessUser.businessEmail = businessuserEmail.text;
    businessUser.businessPhoneNumber = businessuserPhonenumber.text;
    businessUser.password = businessuserPassword.text;
    businessUser.businessprofileImage = businessuserprofileimage.text;
    businessUser.businessBackgroundImage = businessuserBackgroundimage.text;
    businessUser.latitude = businessuserlatitude.text;
    businessUser.longitude = businessuserlongitude.text;
    businessUser.serviceFor = serviceFor.text;
    businessUser.firstServiceName = textFeildata.serviceName.text;
    businessUser.businessRegNo = businessuserRegNo.text;
    businessUser.businessDetails = businessuserDetails.text;
    businessUser.businessWebsite = businessuserWebsite.text;
    businessUser.noOfEmplyees = noOfEmployees.text;
    businessUser.serviceTime = textFeildata.serviceTime.text;
    businessUser.servicePrice = textFeildata.servicePrice.text;
    businessUser.serviceDiscount = textFeildata.servicediscount.text;
    businessUser.businessCard = textFeildata.cardNumber.text;
    businessUser.cardCvv = textFeildata.cardCvv.text;
    businessUser.cardExpDate = textFeildata.cardExp.text;
    businessUser.cardHolderName = textFeildata.cardHolderName.text;
    businessUser.listOfBusinessDoc = textFeildata.SelectDoc;
    businessUser.selectedServiceDays = selectdaya;
    // TODO:
    notifyListeners();
    log("fghjklhgfdghjkljhgfdghjkljhg${businessUser.selectedServiceDays}");
    // appUser.longitude = .text;
    // appUser.latitude = latitudeController.text;
  }

  clearText() {
    log("clear text start");

    serviceCategory.clear();
    businessuserEmail.clear();
    businessuserPhonenumber.clear();
    businessuserPassword.clear();
    businessuserprofileimage.clear();
    businessuserBackgroundimage.clear();
    businessuserlatitude.clear();
    businessuserlongitude.clear();
    serviceFor.clear();
    textFeildata.serviceName.clear();
    businessuserRegNo.clear();
    businessuserDetails.clear();
    businessuserWebsite.clear();
    noOfEmployees.clear();
    textFeildata.serviceTime.clear();
    textFeildata.servicePrice.clear();
    textFeildata.servicediscount.clear();
    textFeildata.cardNumber.clear();
    textFeildata.cardCvv.clear();
    textFeildata.cardExp.clear();
    textFeildata.cardHolderName.clear();
    textFeildata.SelectDoc.clear();
    selectdaya.clear();
    log("clear text end");
  }

  //registeruser
  registerUser(context, user) async {
    setState(ViewState.busy);
    customAuthResult = await authServices.businessuserSignUp(user);
    // if (customAuthResult.user != null) {
    //   // localDataBase.setAppUserRecord(
    //   //     islogin: true,
    //   //     userIamgeURL: appUser.profileimage,
    //   //     useremail: appUser.userEmail,
    //   //     userid: appUser.userId,
    //   //     username: appUser.userName);

    //   await Future.delayed(const Duration(seconds: 10));
    // } else {
    //   // _showMyDialog(context, customAuthResult.errorMessage);
    // }
    setState(ViewState.idle);
  }

  //show dialog
  Future<void> _showMyDialog(context, String? error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //get image
  ImagePicker imagePicker = ImagePicker();
  getImage(
    ImageSource imageSource,
  ) async {
    final img = await imagePicker.pickImage(source: imageSource);
    if (img != null) {
      imagedata = File(img.path);
      // imagedata2 = File(img.path);
      print("image data $imagedata");
      print("image data ${imagedata!.path}");
      notifyListeners();
    }
  }

  getImage2(
    ImageSource imageSource,
  ) async {
    final img = await imagePicker.pickImage(source: imageSource);
    if (img != null) {
      imagedata2 = File(img.path);
      // imagedata2 = File(img.path);
      print("image data $imagedata2");
      print("image data ${imagedata2!.path}");
      notifyListeners();
    }
  }

  uploadImages() async {
    setState(ViewState.busy);

    try {
      final ref = storage
          .ref()
          .child("businessprofile/${DateTime.now().microsecondsSinceEpoch}");
      final ref2 = storage.ref().child(
          "businessbackgroundPicture/${DateTime.now().microsecondsSinceEpoch}");

      final uploadTask = await ref.putFile(File(imagedata!.path));
      final uploadTask1 = await ref2.putFile(File(imagedata2!.path));

      // backgroundimage = await uploadTask.ref.getDownloadURL();
      imageurl = await uploadTask.ref.getDownloadURL();
      imagebackgroundurl = await uploadTask1.ref.getDownloadURL();

      //assign url to customerUser model
      print("before assign url $imageurl");

      notifyListeners();
      // setState(ViewState.idle);
      // log("dpurl???????????$imageurl");
      businessuserprofileimage.text = imageurl!;
      businessuserBackgroundimage.text = imagebackgroundurl!;
      // businessuserprofileimage.text = imageurl!;
      log("profileurl>>>>>>>>>>>>>>>>>>>>>$imageurl");
      log("backgroundurl>>>>>>>>>>>>>>>>>>>>>$imagebackgroundurl");
      log("assign data below");
      log("Model>>>>>>>>>>>>>>>>>>>>>${businessuserprofileimage.text}");
      log("Model>>>>>>>>>>>>>>>>>>>>>${businessuserBackgroundimage.text}");
    } catch (e) {
      log(e.toString());
    }
  }

  uploadDocfile() async {
    setState(ViewState.busy);

    try {
      log("hiii lenght${docFileList!.length}");

      if (docFileList != null) {
        log("the list is not empty");
        for (int i = 0; i < docFileList!.length; i++) {
          final ref = storage.ref().child(
              "businessDocument/${DateTime.now().microsecondsSinceEpoch}");

          final uploadTask =
              await ref.putFile(File(docFileList![i].toString()));

          final finalUrl = await ref.getDownloadURL();
          log("this is final value  $finalUrl");

          docurlList.add(finalUrl.toString());
          textFeildata.SelectDoc.add(finalUrl.toString());
          final byte = uploadTask.bytesTransferred;

          notifyListeners();
          log("this is list value  ${docurlList.toString} ${textFeildata.SelectDoc.length} ${textFeildata.SelectDoc}");

          //  notifyListeners();
        }
      } else {
        log("the list is empty");
      }

      notifyListeners();
      setState(ViewState.idle);
      log("dpurl???????????$docFileUrl");
    } catch (e) {
      log(e.toString());
    }
  }

  ///get location
  ///
  getLocation({
    BuildContext? context,
  }) async {
    setState(ViewState.busy);
    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      print("Location services are not enabled");
      return Future.error('Location services are disabled.');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position newposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // setState(() {
    position = newposition;
    print("position is $position");

    placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    print(
        "position of latitude and langitude ${position.latitude}, ${position.longitude}");
    Placemark place = placemark[0];
    String completeAddress =
        "${place.street} ${place.thoroughfare} ${place.subLocality} ${place.locality} ${place.subAdministrativeArea} ${place.administrativeArea} ${place.postalCode.toString()} ${place.country}";
    String street = "${place.street} ${place.thoroughfare}";
    String city = "${place.locality}";
    String state = "${place.administrativeArea}";
    String country = "${place.country}";
    String postalCode = place.postalCode.toString();
    String latitude = position.latitude.toString();
    String longitude = position.longitude.toString();

    businessuserlatitude.text = latitude;
    businessuserlongitude.text = longitude;

    print(country);
    print(city);
    print(country);
    print(latitude);
    print(longitude);

    // Get.to(GenderSclectionScreen());
    setState(ViewState.idle);
  }

  verfiyaccount({required String finalPhoneNumber}) async {
    log("otp");
    setState(ViewState.busy);

    await authServices.verifyPhoneNumber(
        state: 2, phoneNumber: finalPhoneNumber);

    setState(ViewState.idle);
    // setState(ViewState.)
  }

  Future<void> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    setState(ViewState.busy);
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp.trim());

      await auth
          .signInWithCredential(credential)
          .then((UserCredential credential) {
        // Get.to(LocationScreen());
      });
      setState(ViewState.idle);
    } catch (e) {
      log(e.toString());
      if (e ==
          "The sms code has expired. Please re-send the verification code to try again.") {
        Get.defaultDialog(
          title: "sms expired",
        );
        setState(ViewState.idle);
      }
      Get.defaultDialog(
          title: "Worng OTP",
          content: const Text(
            "Your OTP is invaild.\n Please enter correct OTP",
            textAlign: TextAlign.center,
          ));
      setState(ViewState.idle);
    }
  }
}

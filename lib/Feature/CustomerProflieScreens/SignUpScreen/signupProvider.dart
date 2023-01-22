import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/Backend/DatabaseService/authservice.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';
import 'package:service_app/Backend/core/Models/customermodel.dart';

import 'package:geocoding/geocoding.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessAddServiceScreen/BusinessAddServiceScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessProfileCompletScreen/BusinessProfileCompletScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessSignUpScreen/BusinessSignUpProvider.dart';

import '../GenderSelectScreen/GenderSelectScreen.dart';
import '../LocationScreen/LocationScreen.dart';

TextEditingController userName = TextEditingController();
TextEditingController userEmail = TextEditingController();
TextEditingController userPhonenumber = TextEditingController();
TextEditingController userPassword = TextEditingController();
TextEditingController userprofileimage = TextEditingController();
TextEditingController userlatitude = TextEditingController();
TextEditingController userlongitude = TextEditingController();
TextEditingController usergender = TextEditingController();

class SignUpProvider extends BaseViewModal {
  String? imageurl;
  File? imagedata;
  bool ischeck = false;
  late Position position;
  late List<Placemark> placemark;
  String address = '';
  bool serviceEnabled = false;
  // bool isMale = false;

  //formkey
  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();

//
  CustomAuthResult customAuthResult = CustomAuthResult();

  //files
  final FirebaseStorage storage = FirebaseStorage.instance;
  final appUser = AppUser();
  final authServices = AuthServices();
  valuechange(bool value) {
    ischeck = value;
    notifyListeners();
  }

  //assigndata
  assignData() {
    appUser.userName = userName.text;
    appUser.userEmail = userEmail.text;
    appUser.phoneNumber = userPhonenumber.text;
    appUser.password = userPassword.text;
    appUser.profileImage = userprofileimage.text;
    appUser.latitude = userlatitude.text;
    appUser.longitude = userlongitude.text;
    appUser.gender = usergender.text;

    // appUser.longitude = .text;
    // appUser.latitude = latitudeController.text;
  }

  printfun() {
    log("provider print name: ${appUser.userName}");
    log("provider print  email: ${appUser.userEmail}");
    log("provider print  phonenumber: ${appUser.phoneNumber}");
    log("provider print password: ${appUser.password}");
    log("provider print longitude: ${appUser.longitude}");
    log("provider print latitude: ${appUser.latitude}");
    log("provider prin gendert: ${appUser.gender}");
    log("another");
    log("controller print name: ${userName.text}");
    log("controller print name: ${userEmail.text}");
    log("controller print name: ${userPhonenumber.text}");
    log("controller print image: ${userprofileimage.text}");
    log("controller print name: ${userlatitude.text}");
    log("controller print name: ${userlongitude.text}");
    log("controller print name: ${usergender.text}");
    log("controller print name: ${userName.text}");
  }

  //cleardata

  clearText() {
    userName.clear();
    userEmail.clear();
    userPassword.clear();
    userPhonenumber.clear();
    userprofileimage.clear();
    userlatitude.clear();
    userlongitude.clear();
    usergender.clear();
  }

  verfiyaccount() async {
    setState(ViewState.busy);

    await authServices.verifyPhoneNumber(phoneNumber: userPhonenumber.text);

    setState(ViewState.idle);
    // setState(ViewState.)
  }

  //registeruser
  registerUser(context, user) async {
    setState(ViewState.busy);
    customAuthResult = await authServices.userSignUp(user);
    if (customAuthResult.user != null) {
      // localDataBase.setAppUserRecord(
      //     islogin: true,
      //     userIamgeURL: appUser.profileimage,
      //     useremail: appUser.userEmail,
      //     userid: appUser.userId,
      //     username: appUser.userName);

      // Get.to(HomeScreen());
      await Future.delayed(const Duration(seconds: 2));
    } else {
      _showMyDialog(context, customAuthResult.errorMessage);
    }
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
                Text(error!),
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
      print("image data $imagedata");
      print("image data ${imagedata!.path}");
      notifyListeners();
    }
  }

  uploadImages() async {
    setState(ViewState.busy);

    try {
      final ref = storage
          .ref()
          .child("SignUp/${DateTime.now().microsecondsSinceEpoch}");
      //Upload the file to firebase
      final uploadTask = await ref.putFile(File(imagedata!.path));

      imageurl = await uploadTask.ref.getDownloadURL();
      // profileurl = await uploadTask1.ref.getDownloadURL();
      //assign url to customerUser model
      print("before assign url $imageurl");
      // appUser.profileImage = imageurl ?? '';
      // userprofileimage.text = imageurl!;
      print("after assign url ${appUser.profileImage}");

      // customerUser.profileImageUrl = profileurl ?? '';
      notifyListeners();
      setState(ViewState.idle);
      // log("dpurl???????????$imageurl");
      userprofileimage.text = imageurl!;
      log("profileurl>>>>>>>>>>>>>>>>>>>>>$imageurl");
      log("Model>>>>>>>>>>>>>>>>>>>>>${userprofileimage.text}");
    } catch (e) {
      log(e.toString());
    }
  }

  ///get location
  ///
  getLocation({
    BuildContext? context,
    int locationState = 1,
  }) async {
    // isloading = true;
    setState(ViewState.busy);
    // notifyListeners();
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
    setState(ViewState.busy);
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

    userlatitude.text = latitude;
    userlongitude.text = longitude;
    businessuserlatitude.text = latitude;
    businessuserlongitude.text = longitude;

    print(country);
    print(city);
    print(country);
    print(latitude);
    print(longitude);

    locationState == 1
        ? Get.to(GenderSclectionScreen())
        : Get.to(BusinessProfileCompletScreen());
    setState(ViewState.idle);
  }

  //
  Future<void> verifyOtp({
    int pagestate = 1,
    required String verificationId,
    required String otp,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(ViewState.busy);
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp.trim());

      await auth
          .signInWithCredential(credential)
          .then((UserCredential credential) {
        pagestate == 1
            ? Get.offAll(LocationScreen())
            : Get.offAll(BusinessAddServiceScreen());
        // authController.signUp(
        //   email,
        //   password,
        //   firstname,
        //   lastname,
        //   refferealController.text,
        // );
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

import 'package:flutter/cupertino.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/CustomerProflieScreens/HomScreen/HomeScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapScreen.dart';

List<HomeModel2> all_Data = [
  HomeModel2(
    imagePath: images.homeScreen0,
    screenRoute: MapScreen(),
  ),
  HomeModel2(imagePath: images.homeScreen, screenRoute: MapScreen()),
  HomeModel2(imagePath: images.homeScreen2, screenRoute: MapScreen()),
  HomeModel2(imagePath: images.homeScreen3, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen4, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen5, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen6, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen7, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen8, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen9, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen10, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen11, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen12, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen13, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen14, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen15, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen16, screenRoute: HomeScreen()),
  HomeModel2(imagePath: images.homeScreen17, screenRoute: HomeScreen()),
  // HomeModel2(imagePath: images.homeScreen18, screenRoute: HomeScreen()),
  // HomeModel2(imagePath: images.homeScreen19, screenRoute: HomeScreen()),
  // HomeModel2(imagePath: images.homeScreen20, screenRoute: HomeScreen()),
];

class HomeModel2 {
  HomeModel2({this.imagePath, this.screenRoute});

  Widget? screenRoute;
  String? imagePath;
}

final List<String> items = [
  'Adult Bars Entertainment',
  'Architect',
  'Barbers',
  'Auto Mechanic',
  'Beautician',
  'Construction',
  'Boutiques',
  'Dentist',
  'Designer Stylist',
  'Doctors',
  'Gym',
  'Hair Stylist',
  'Hardware',
  'Hotels',
  'Message Therapist',
  'Night Club',
  'Personal Trainer',
  'Realtors',
];

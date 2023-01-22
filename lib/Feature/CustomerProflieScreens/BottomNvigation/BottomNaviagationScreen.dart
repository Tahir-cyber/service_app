import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/UpcomingAppointmentScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/EventsScreens/EventHomeScreen.dart';
import 'package:service_app/Feature/CustomerProflieScreens/HomScreen/HomeScreen.dart';

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State<BottomNavigations> createState() => _BottomNavigationsState();
}

class _BottomNavigationsState extends State<BottomNavigations> {
  @override
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List allScreen = [
    const Tabbar(),
    HomeScreen(),
    EventScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          color: baseColor,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            ImageIcon(
              AssetImage(images.bottomnavigation),
              color: white,
            ),
            ImageIcon(
              AssetImage(images.bottomnavigation2),
              color: white,
            ),
            ImageIcon(
              AssetImage(
                images.bottomnavigation3,
              ),
              color: white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: allScreen[_page]);
  }
}

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/classesInstance.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BisnessBookingScreen/BisnessBookingScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessHomeScreen/BusinessHomeScreen.dart';

import '../BusinessEvents/BusinessEventScreen.dart';

class BusinessBottomNavigations extends StatefulWidget {
  const BusinessBottomNavigations({super.key});

  @override
  State<BusinessBottomNavigations> createState() =>
      _BusinessBottomNavigations();
}

class _BusinessBottomNavigations extends State<BusinessBottomNavigations> {
  @override
  //State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List allScreen = [
    const BusinessTabbar(),
    BusinessHomeScreen(),
    BusinesseventScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.,
        bottomNavigationBar: CurvedNavigationBar(
          // height: 48.h,
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

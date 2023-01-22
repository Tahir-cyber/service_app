import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BisnessBookingScreen/BusinessCompleteOrderScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BisnessBookingScreen/BusinessUpcomingScreen.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessDrawar/BusinessDrawar.dart';

import '../../../Core/appColors.dart';
import '../BusinessHomeScreen/BusinessHomeScreen.dart';

class BusinessTabbar extends StatefulWidget {
  const BusinessTabbar({super.key});

  @override
  State<BusinessTabbar> createState() => _BusinessTabbarState();
}

class _BusinessTabbarState extends State<BusinessTabbar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: BusinessDrawar(),
      body: DefaultTabController(
        length: 2,
        child: Screenlayout_widget(
          paddingstate: 2,
          appbarData: appbar(
              state: 2,
              data: "Appointments",
              onpressed: () {
                _scaffoldKey.currentState!.openDrawer();
              }),
          screendata: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: PreferredSize(
                      preferredSize: _tabBar.preferredSize,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          height: _tabBar.preferredSize.height,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50.r)),
                          child: _tabBar,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: TabBarView(children: [
                      BusniessUpcomingOrders(),
                      BusinessComplateOrders(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: baseColor),
        padding: EdgeInsets.all(8.r),
        tabs: [
          Tab(
            height: 30.h,
            text: "Upcoming",
          ),
          Tab(
            height: 30.h,
            text: "Completed",
          ),
        ],
      );
}

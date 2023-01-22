import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/Appointments%20Screen/UpcomingOrders.dart';
import '../EventsScreens/EventHomeScreen.dart';
import '../ShopProfileDetails/ShopProfileDetails.dart';
import '../UserDrawar/UserDrawar.dart';
import 'CompleteOrder.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: UserDrawar(),
      body: DefaultTabController(
        length: 2,
        child: Screenlayout_widget(
          paddingstate: 2,
          appbarData: appbar(
              state: 2,
              data: "Appointments",
              onpressed: () {
                print("click");

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
                  const Expanded(
                    flex: 9,
                    child: TabBarView(children: [
                      UpcomingOrders(),
                      ComplateOrders(),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Feature/BusinessProfileScreens/BusinessSignUpScreen/BusinessSignUpProvider.dart';
import 'package:service_app/Feature/BusinessProfileScreens/SignInScreenBusiness/SginProvider.dart';
import 'package:service_app/Feature/CustomerProflieScreens/SignUpScreen/signupProvider.dart';
import 'package:service_app/Feature/SplashScreen/SplashScreen.dart';
import 'Feature/BusinessProfileScreens/BusinessAddServiceScreen/BusinessAddServiceScreen.dart';
import 'Feature/BusinessProfileScreens/BusinessAddServiceScreen/business_add_screen_services_provider.dart';
import 'Feature/BusinessProfileScreens/EditBusinessProfile/edit_business_profile_provider.dart';
import 'Feature/BusinessProfileScreens/EditBusinessProfile/update_employee/update_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),
        ChangeNotifierProvider<BusinessSignUpProvider>(
            create: (_) => BusinessSignUpProvider()),
        ChangeNotifierProvider<BusinessAddServicesProvider>(
            create: (_) => BusinessAddServicesProvider()),
        ChangeNotifierProvider<BSigninProvider>(
            create: (_) => BSigninProvider()),
        ChangeNotifierProvider<EditBusinessProfileProvider>(
            create: (_) => EditBusinessProfileProvider()),
        ChangeNotifierProvider<UpdateEmployeeProvider>(
            create: (_) => UpdateEmployeeProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 710),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Service App',

            // theme: AppTheme.basic,
            // initialRoute: AppPages.initial,
            // getPages: AppPages.routes,
            home: SplashScreen(),
          );
        },
        child: const SplashScreen(),
      ),
    );
  }
}

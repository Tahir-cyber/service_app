import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_app/Backend/DatabaseService/datastoreService.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';

final lat = double.parse(activeuser.latitude.toString());
final long = double.parse(activeuser.longitude.toString());

class MapProvider extends BaseViewModal {
  MapProvider(categoryName) {
    getallServices(categoryName);

    //log('allServices: ${allServices.length} ....$categoryName....');
  }

  // BusinessAppUser allService = BusinessAppUser();
  List<BusinessAppUser> allServices = [];
  List<BusinessAppUser> categoryList = [];
  DatabaseServices _databaseServices = DatabaseServices();

  /*
  in this function we get all list of services 
  then find selected categoryName 
  if pound then add to new list categoryList
  
  */

  getallServices(categoryName) async {
    setState(ViewState.busy);
    allServices = await _databaseServices.getallServices();
    log('#################################');
    log('allServices: ${allServices.length}   $categoryName');
    log('category which will show you:  $categoryName');
    for (int i = 0; i < allServices.length; i++) {
      if (allServices[i].serviceCategory == categoryName) {
        print('this category going to add ${allServices[i].serviceCategory}');
        categoryList.add(allServices[i]);
      }
    }
    log('this is category list lenght ${categoryList.length}');
    // notifyListeners();
    setState(ViewState.idle);
  }

  final LatLng _kMapCenter = LatLng(lat, long);
  BitmapDescriptor? _markerIcon;

  Completer<GoogleMapController> controller = Completer();

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(lat, long),
    zoom: 16.4746,
  );

  Marker createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _kMapCenter,
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: MarkerId('marker_1'),
        position: _kMapCenter,
      );
    }
  }

  Future<void> createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: const Size.square(48));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/red_square.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    _markerIcon = bitmap;
    notifyListeners();
  }
}

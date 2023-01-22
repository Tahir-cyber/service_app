// ignore_for_file: prefer_is_empty

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:service_app/Backend/DatabaseService/localstoreService.dart';
import 'package:service_app/Backend/core/Models/basemodel.dart';
import 'package:service_app/Backend/core/Models/businessmodel.dart';
import 'package:service_app/Feature/CustomerProflieScreens/BottomNvigation/BottomNaviagationScreen.dart';
import '../../Feature/BusinessProfileScreens/BusinessSubscriptionScreen/BusinessSubscriptionScreen.dart';
import '../core/Models/customermodel.dart';

// class currentUser extends BaseViewModal{

//   AppUser activeuser = AppUser();

// }

AppUser activeuser = AppUser();
BusinessAppUser bussinessActiveUser = BusinessAppUser();

class DatabaseServices extends BaseViewModal {
  final _db = FirebaseFirestore.instance;

  // @override

  ///
  /// register user
  ///
  registerAppUser(AppUser appUser) async {
    try {
      // print("inside registerapp 1");
      await _db
          .collection("appUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
      // print("inside registerapp 1");

      await localDataBaseObject.setAppUserRecord(
        isBusinesslogin: false,
        isCustomerlogin: true,
        userIamgeURL: appUser.profileImage,
        useremail: appUser.userEmail,
        userid: appUser.appUserId,
        username: appUser.userName,
      );

      Get.offAll(const BottomNavigations());
    } catch (e) {
      // print("Exception @DatabaseServices RegisterUser : $e");
    }
  }

  registerBusinessAppUser(BusinessAppUser businessAppUser) async {
    try {
      log("inside registerapp 1");
      log("this first asssign list${businessAppUser.listOfBusinessDoc}");
      log("this second assign list${businessAppUser.selectedServiceDays}");
      log("this second assign list${businessAppUser.businessCard}");
      log("this second assign list${businessAppUser.businessBackgroundImage}");
      log("this second assign list${businessAppUser.businessDetails}");
      await _db
          .collection("BusinessappUser")
          .add(businessAppUser.toJson())
          .then((value) {
        _db
            .collection("BusinessappUser")
            .doc(value.id)
            .update({"businessUserId": value.id});
      });
      log("inside registerapp 2");

      // await localDataBaseObject.setAppUserRecord(
      //   isBusinesslogin: true,
      //   isCustomerlogin: false,
      //   // userIamgeURL: BusinessAppUser.profileImage,
      //   // useremail: appUser.userEmail,
      //   // userid: appUser.appUserId,
      //   // username: appUser.userName,
      // );
      log("inside registerapp 3");
      Get.to(() => BusinessSubscriptionScreen());
      // Get.offAll(() => BusinessSubscriptionScreen());
    } catch (e) {
      // print("Exception @DatabaseServices RegisterUser : $e");
    }
  }

  Future<AppUser?> getUser(id) async {
    print('@getUser: id: $id');
    try {
      final snapshot = await _db.collection('appUser').doc(id).get();
      print('User Data: ${snapshot.data()}');
      // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      activeuser = AppUser.fromJson(snapshot.data(), snapshot.id);
      notifyListeners();
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
//      print(s);
      // return null;
    }
    return null;
  }

  Future<BusinessAppUser?> businessgetUser(id) async {
    log('@getUser: id: $id');
    try {
      log("business inside 3 sub type");
      final snapshot = await _db.collection('BusinessappUser').doc(id).get();
      log('User Data: ${snapshot.data()}');
      log("business inside 3(2) sub type");
      log("id 1$id");
      log(snapshot.id.toString());

      // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      bussinessActiveUser =
          BusinessAppUser.fromJson(snapshot.data(), snapshot.id);
      log("business inside ${bussinessActiveUser.businessEmail}");
      log("business inside ${bussinessActiveUser.businessUserId}");
      // log("business inside ${bussinessActiveUser.businessName}");
      log("business inside ${bussinessActiveUser.businessPhoneNumber}");
      // log("business inside ${bussinessActiveUser.businessAddress}");
      notifyListeners();

      return BusinessAppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      log("business inside 3 sub type error");
      print('Exception @DatabaseService/getUser $e');
//      print(s);
      // return null;
    }
    return null;
  }

  //////////Get CustomerUserID//////////
  /////////////////////////////////////
//   Future<BusinessAppUser?> busniessgGetUser(id) async {
//     print('@getUser: id: $id');
//     try {
//       log('@getUser: id: $id');
//       final snapshot = await _db.collection('BusinessappUser').doc(id).get();
//       // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//       bussinessUser = BusinessAppUser.fromJson(snapshot.data(), snapshot.id);
//       notifyListeners();
//       return BusinessAppUser.fromJson(snapshot.data(), snapshot.id);
//     } catch (e) {
//       log('The error is produced from here Exception @DatabaseService/getUser $e');
// //      print(s);
//       return null;
//     }
//   }

  Future<List<BusinessAppUser>> getallServices() async {
    List<BusinessAppUser> allServices = [];
    try {
      final snapshot = (await FirebaseFirestore.instance
          .collection('BusinessappUser')
          .get());
      if (snapshot.docs.length > 0) {
        for (int i = 0; i < snapshot.docs.length; i++) {
          allServices.add(BusinessAppUser.fromJson(
              snapshot.docs[i].data(), snapshot.docs[i].id));
        }
      }
    } catch (e) {
      print('Error @getRequests => $e');
    }
    return allServices;
  }
}















  ///
  /// Add criminal data in database
  ///
  // addCriminal(Criminal criminal) async {
  //   try {
  //     await _db.collection("criminal").add(criminal.toJson());
  //   } catch (e) {
  //     print("Exception @DatabaseService/AddCriminal : $e");
  //   }
  // }

  // ///
  // /// get criminal data from database
  // ///
  // Future<List<Criminal>> getCriminals() async {
  //   final List<Criminal> criminalsList = [];
  //   try {
  //     QuerySnapshot snapshot = await _db
  //         .collection('criminal')
  //         .orderBy('addedAt', descending: true)
  //         .get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((doc) {
  //         criminalsList.add(Criminal.fromJson(doc, doc.id));
  //       });
  //     } else {
  //       print('No criminal data in database');
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/GetCriminals : $e');
  //   }
  //   return criminalsList;
  // }

  // ///
  // /// Delete criminal document
  // ///
  // deleteCriminal(criminal) {
  //   try {
  //     _db.collection('criminal').doc(criminal).delete();
  //   } catch (e) {
  //     print('Exception @DatabaseServices/DeleteCriminal :$e');
  //   }
  // }

  // ///
  // /// Update criminal data
  // ///
  // updateCriminal(String criminalID, Criminal updateCriminal) {
  //   try {
  //     _db
  //         .collection('criminal')
  //         .doc(criminalID)
  //         .update(updateCriminal.toJson());
  //   } catch (e) {
  //     print('Exception @DatabaseServices/UpdateCriminal :$e');
  //   }
  // }

  // ///
  // /// Get access User
  // ///
  // Future<List<AccessUser>> getAccessUser() async {
  //   final List<AccessUser> accessUsers = [];
  //   try {
  //     QuerySnapshot snapshot = await _db.collection('accessUser').get();
  //     if (snapshot.docs.length > 0) {
  //       snapshot.docs.forEach((doc) {
  //         accessUsers.add(AccessUser.fromJson(doc, doc.id));
  //       });
  //     } else {
  //       print('No Access User in database');
  //     }
  //   } catch (e) {
  //     print('Exception @DatabaseService/GetAccessUser : $e');
  //   }
  //   return accessUsers;
  // }

  // ///
  // ///
  // /// Get object
  // ///
  // // Future<Criminal> getCriminal(String? id) async {
  // //   print("@getCriminal ==> id:  $id");
  // //   try {
  // //     final snapshot = await _db
  // //         .collection('criminal').doc(id).get();
  // //     return Criminal.fromJson(snapshot.data(), snapshot.id);
  // //   } catch (e) {
  // //     print('Exception @DatabaseService/UpdateCriminal : $e');
  // //     throw e;
  // //   }
  // // }

// }

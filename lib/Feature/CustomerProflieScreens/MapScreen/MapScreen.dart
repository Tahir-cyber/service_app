import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Backend/core/Enums/enums.dart';
import 'package:service_app/Core/appColors.dart';
import 'package:service_app/Core/commonMethod.dart';
import 'package:service_app/Core/common_var.dart';
import 'package:service_app/Core/common_widgets.dart';
import 'package:service_app/Feature/CustomerProflieScreens/MapScreen/MapProvider.dart';
import '../HomScreen/homeModel.dart';
import '../ShopScreen.dart/ShopScreen.dart';
import 'MapScreenData.dart';

class MapScreen extends StatelessWidget {
  final categoryName;
  const MapScreen({Key? key, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapProvider(categoryName),
      child: Consumer<MapProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: Scaffold(
                body: Screenlayout_widget(
                  paddingstate: 2,
                  state: 2,
                  height: 224,
                  screendata: Stack(
                    children: [
                      GoogleMap(
                        markers: <Marker>{model.createMarker()},
                        mapType: MapType.satellite,
                        initialCameraPosition: model.kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          model.controller.complete(controller);
                        },
                      ),

                      // Image.asset(
                      //   images.mapScreen6,
                      //   fit: BoxFit.cover,
                      //   height: 1.sh,
                      //   width: 1.sw,
                      // ),
                      // Image.asset(
                      //   images.mapScreen7,
                      //   // fit: BoxFit.cover,
                      //   height: 1.sh,
                      //   width: 1.sw,
                      // ),
                    ],
                  ),
                  appbarData: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      minmium,
                      backButton(state: 2),
                      Searchbar(name: "Events, restaurants, hairstylists"),
                      minmium,
                      Text_widget(
                        name: "Category",
                        state: 2,
                        text_size: 13,
                        Text_color: white,
                      ),
                      minmium,
                      SizedBox(
                        height: 60.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: all_Data.length,
                                    itemBuilder: (context, index) {
                                      var data = all_Data[index];
                                      return Padding(
                                        padding: EdgeInsets.only(right: 12.w),
                                        child: Image.asset(
                                          data.imagePath!,
                                          scale: 3.5,
                                        ),
                                      );
                                    }))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomSheet: custom_bottom_sheet(
                    height: 170,
                    data: Row(
                      children: [
                        Expanded(
                            child: model.categoryList.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.categoryList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: () {
                                            Get.to(ShopScreen(
                                                singleService:
                                                    model.categoryList));
                                          },
                                          child: Bottom_Map_Data(
                                              singleService:
                                                  model.categoryList[index]));
                                    })
                                : Center(
                                    child: const Text(
                                        "Ooh's this category is empty")))
                      ],
                    )),
              ));
        },
      ),
    );
  }
}

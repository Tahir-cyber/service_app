// import 'dart:async';
// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui';

// import 'package:flutter/material.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MarkerIconsPage extends GoogleMapExampleAppPage {
//   const MarkerIconsPage({Key? key})
//       : super(const Icon(Icons.image), 'Marker icons', key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MarkerIconsBody();
//   }
// }

// class MarkerIconsBody extends StatefulWidget {
//   const MarkerIconsBody({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => MarkerIconsBodyState();
// }

// const LatLng _kMapCenter = LatLng(52.4478, -3.5402);

// class MarkerIconsBodyState extends State<MarkerIconsBody> {
//   GoogleMapController? controller;
//   // BitmapDescriptor? _markerIcon;

//   @override
//   Widget build(BuildContext context) {
//     _createMarkerImageFromAsset(context);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Center(
//           child: SizedBox(
//             width: 350.0,
//             height: 300.0,
//             child: GoogleMap(
//               initialCameraPosition: const CameraPosition(
//                 target: _kMapCenter,
//                 zoom: 7.0,
//               ),
//               markers: <Marker>{_createMarker()},
//               onMapCreated: _onMapCreated,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Marker _createMarker() {
//     if (_markerIcon != null) {
//       return Marker(
//         markerId: const MarkerId('marker_1'),
//         position: _kMapCenter,
//         icon: _markerIcon!,
//       );
//     } else {
//       return const Marker(
//         markerId: MarkerId('marker_1'),
//         position: _kMapCenter,
//       );
//     }
//   }

//   Future<void> _createMarkerImageFromAsset(BuildContext context) async {
//     if (_markerIcon == null) {
//       final ImageConfiguration imageConfiguration =
//           createLocalImageConfiguration(context, size: const Size.square(48));
//       BitmapDescriptor.fromAssetImage(
//               imageConfiguration, 'assets/red_square.png')
//           .then(_updateBitmap);
//     }
//   }

//   void _updateBitmap(BitmapDescriptor bitmap) {
//     setState(() {
//       _markerIcon = bitmap;
//     });
//   }

//   void _onMapCreated(GoogleMapController controllerParam) {
//     setState(() {
//       controller = controllerParam;
//     });
//   }
// }

// class PlaceMarkerPage extends GoogleMapExampleAppPage {
//   const PlaceMarkerPage({Key? key})
//       : super(const Icon(Icons.place), 'Place marker', key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const PlaceMarkerBody();
//   }
// }

// class PlaceMarkerBody extends StatefulWidget {
//   const PlaceMarkerBody({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PlaceMarkerBodyState();
// }

// typedef MarkerUpdateAction = Marker Function(Marker marker);

// class PlaceMarkerBodyState extends State<PlaceMarkerBody> {
//   PlaceMarkerBodyState();
//   static const LatLng center = LatLng(-33.86711, 151.1947171);

//   GoogleMapController? controller;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   MarkerId? selectedMarker;
//   int _markerIdCounter = 1;
//   LatLng? markerPosition;

//   // ignore: use_setters_to_change_properties
//   void _onMapCreated(GoogleMapController controller) {
//     this.controller = controller;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void _onMarkerTapped(MarkerId markerId) {
//     final Marker? tappedMarker = markers[markerId];
//     if (tappedMarker != null) {
//       setState(() {
//         final MarkerId? previousMarkerId = selectedMarker;
//         if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
//           final Marker resetOld = markers[previousMarkerId]!
//               .copyWith(iconParam: BitmapDescriptor.defaultMarker);
//           markers[previousMarkerId] = resetOld;
//         }
//         selectedMarker = markerId;
//         final Marker newMarker = tappedMarker.copyWith(
//           iconParam: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueGreen,
//           ),
//         );
//         markers[markerId] = newMarker;

//         markerPosition = null;
//       });
//     }
//   }

//   Future<void> _onMarkerDrag(MarkerId markerId, LatLng newPosition) async {
//     setState(() {
//       markerPosition = newPosition;
//     });
//   }

//   Future<void> _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
//     final Marker? tappedMarker = markers[markerId];
//     if (tappedMarker != null) {
//       setState(() {
//         markerPosition = null;
//       });
//       await showDialog<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//                 actions: <Widget>[
//                   TextButton(
//                     child: const Text('OK'),
//                     onPressed: () => Navigator.of(context).pop(),
//                   )
//                 ],
//                 content: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 66),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text('Old position: ${tappedMarker.position}'),
//                         Text('New position: $newPosition'),
//                       ],
//                     )));
//           });
//     }
//   }

//   void _add() {
//     final int markerCount = markers.length;

//     if (markerCount == 12) {
//       return;
//     }

//     final String markerIdVal = 'marker_id_$_markerIdCounter';
//     _markerIdCounter++;
//     final MarkerId markerId = MarkerId(markerIdVal);

//     final Marker marker = Marker(
//       markerId: markerId,
//       position: LatLng(
//         center.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
//         center.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
//       ),
//       infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
//       onTap: () => _onMarkerTapped(markerId),
//       onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
//       onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
//     );

//     setState(() {
//       markers[markerId] = marker;
//     });
//   }

//   void _remove(MarkerId markerId) {
//     setState(() {
//       if (markers.containsKey(markerId)) {
//         markers.remove(markerId);
//       }
//     });
//   }

//   void _changePosition(MarkerId markerId) {
//     final Marker marker = markers[markerId]!;
//     final LatLng current = marker.position;
//     final Offset offset = Offset(
//       center.latitude - current.latitude,
//       center.longitude - current.longitude,
//     );
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         positionParam: LatLng(
//           center.latitude + offset.dy,
//           center.longitude + offset.dx,
//         ),
//       );
//     });
//   }

//   void _changeAnchor(MarkerId markerId) {
//     final Marker marker = markers[markerId]!;
//     final Offset currentAnchor = marker.anchor;
//     final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         anchorParam: newAnchor,
//       );
//     });
//   }

//   Future<void> _changeInfoAnchor(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     final Offset currentAnchor = marker.infoWindow.anchor;
//     final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         infoWindowParam: marker.infoWindow.copyWith(
//           anchorParam: newAnchor,
//         ),
//       );
//     });
//   }

//   Future<void> _toggleDraggable(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         draggableParam: !marker.draggable,
//       );
//     });
//   }

//   Future<void> _toggleFlat(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         flatParam: !marker.flat,
//       );
//     });
//   }

//   Future<void> _changeInfo(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     final String newSnippet = '${marker.infoWindow.snippet!}*';
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         infoWindowParam: marker.infoWindow.copyWith(
//           snippetParam: newSnippet,
//         ),
//       );
//     });
//   }

//   Future<void> _changeAlpha(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     final double current = marker.alpha;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         alphaParam: current < 0.1 ? 1.0 : current * 0.75,
//       );
//     });
//   }

//   Future<void> _changeRotation(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     final double current = marker.rotation;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         rotationParam: current == 330.0 ? 0.0 : current + 30.0,
//       );
//     });
//   }

//   Future<void> _toggleVisible(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         visibleParam: !marker.visible,
//       );
//     });
//   }

//   Future<void> _changeZIndex(MarkerId markerId) async {
//     final Marker marker = markers[markerId]!;
//     final double current = marker.zIndex;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         zIndexParam: current == 12.0 ? 0.0 : current + 1.0,
//       );
//     });
//   }

//   void _setMarkerIcon(MarkerId markerId, BitmapDescriptor assetIcon) {
//     final Marker marker = markers[markerId]!;
//     setState(() {
//       markers[markerId] = marker.copyWith(
//         iconParam: assetIcon,
//       );
//     });
//   }

//   Future<BitmapDescriptor> _getAssetIcon(BuildContext context) async {
//     final Completer<BitmapDescriptor> bitmapIcon =
//         Completer<BitmapDescriptor>();
//     final ImageConfiguration config = createLocalImageConfiguration(context);

//     const AssetImage('assets/red_square.png')
//         .resolve(config)
//         .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
//       final ByteData? bytes =
//           await image.image.toByteData(format: ImageByteFormat.png);
//       if (bytes == null) {
//         bitmapIcon.completeError(Exception('Unable to encode icon'));
//         return;
//       }
//       final BitmapDescriptor bitmap =
//           BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
//       bitmapIcon.complete(bitmap);
//     }));

//     return await bitmapIcon.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final MarkerId? selectedId = selectedMarker;
//     return Stack(children: <Widget>[
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: const CameraPosition(
//                 target: LatLng(-33.852, 151.211),
//                 zoom: 11.0,
//               ),
//               markers: Set<Marker>.of(markers.values),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextButton(
//                 onPressed: _add,
//                 child: const Text('Add'),
//               ),
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _remove(selectedId),
//                 child: const Text('Remove'),
//               ),
//             ],
//           ),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             children: <Widget>[
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _changeInfo(selectedId),
//                 child: const Text('change info'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () => _changeInfoAnchor(selectedId),
//                 child: const Text('change info anchor'),
//               ),
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _changeAlpha(selectedId),
//                 child: const Text('change alpha'),
//               ),
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _changeAnchor(selectedId),
//                 child: const Text('change anchor'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () => _toggleDraggable(selectedId),
//                 child: const Text('toggle draggable'),
//               ),
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _toggleFlat(selectedId),
//                 child: const Text('toggle flat'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () => _changePosition(selectedId),
//                 child: const Text('change position'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () => _changeRotation(selectedId),
//                 child: const Text('change rotation'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () => _toggleVisible(selectedId),
//                 child: const Text('toggle visible'),
//               ),
//               TextButton(
//                 onPressed:
//                     selectedId == null ? null : () => _changeZIndex(selectedId),
//                 child: const Text('change zIndex'),
//               ),
//               TextButton(
//                 onPressed: selectedId == null
//                     ? null
//                     : () {
//                         _getAssetIcon(context).then(
//                           (BitmapDescriptor icon) {
//                             _setMarkerIcon(selectedId, icon);
//                           },
//                         );
//                       },
//                 child: const Text('set marker icon'),
//               ),
//             ],
//           ),
//         ],
//       ),
//       Visibility(
//         visible: markerPosition != null,
//         child: Container(
//           color: Colors.white70,
//           height: 30,
//           padding: const EdgeInsets.only(left: 12, right: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               if (markerPosition == null)
//                 Container()
//               else
//                 Expanded(child: Text('lat: ${markerPosition!.latitude}')),
//               if (markerPosition == null)
//                 Container()
//               else
//                 Expanded(child: Text('lng: ${markerPosition!.longitude}')),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }
// }

// class PlaceCirclePage extends GoogleMapExampleAppPage {
//   const PlaceCirclePage({Key? key})
//       : super(const Icon(Icons.linear_scale), 'Place circle', key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const PlaceCircleBody();
//   }
// }

// class PlaceCircleBody extends StatefulWidget {
//   const PlaceCircleBody({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PlaceCircleBodyState();
// }

// class PlaceCircleBodyState extends State<PlaceCircleBody> {
//   PlaceCircleBodyState();

//   GoogleMapController? controller;
//   Map<CircleId, Circle> circles = <CircleId, Circle>{};
//   int _circleIdCounter = 1;
//   CircleId? selectedCircle;

//   // Values when toggling circle color
//   int fillColorsIndex = 0;
//   int strokeColorsIndex = 0;
//   List<Color> colors = <Color>[
//     Colors.purple,
//     Colors.red,
//     Colors.green,
//     Colors.pink,
//   ];

//   // Values when toggling circle stroke width
//   int widthsIndex = 0;
//   List<int> widths = <int>[10, 20, 5];

//   // ignore: use_setters_to_change_properties
//   void _onMapCreated(GoogleMapController controller) {
//     this.controller = controller;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void _onCircleTapped(CircleId circleId) {
//     setState(() {
//       selectedCircle = circleId;
//     });
//   }

//   void _remove(CircleId circleId) {
//     setState(() {
//       if (circles.containsKey(circleId)) {
//         circles.remove(circleId);
//       }
//       if (circleId == selectedCircle) {
//         selectedCircle = null;
//       }
//     });
//   }

//   void _add() {
//     final int circleCount = circles.length;

//     if (circleCount == 12) {
//       return;
//     }

//     final String circleIdVal = 'circle_id_$_circleIdCounter';
//     _circleIdCounter++;
//     final CircleId circleId = CircleId(circleIdVal);

//     final Circle circle = Circle(
//       circleId: circleId,
//       consumeTapEvents: true,
//       strokeColor: Colors.orange,
//       fillColor: Colors.green,
//       strokeWidth: 5,
//       center: _createCenter(),
//       radius: 50000,
//       onTap: () {
//         _onCircleTapped(circleId);
//       },
//     );

//     setState(() {
//       circles[circleId] = circle;
//     });
//   }

//   void _toggleVisible(CircleId circleId) {
//     final Circle circle = circles[circleId]!;
//     setState(() {
//       circles[circleId] = circle.copyWith(
//         visibleParam: !circle.visible,
//       );
//     });
//   }

//   void _changeFillColor(CircleId circleId) {
//     final Circle circle = circles[circleId]!;
//     setState(() {
//       circles[circleId] = circle.copyWith(
//         fillColorParam: colors[++fillColorsIndex % colors.length],
//       );
//     });
//   }

//   void _changeStrokeColor(CircleId circleId) {
//     final Circle circle = circles[circleId]!;
//     setState(() {
//       circles[circleId] = circle.copyWith(
//         strokeColorParam: colors[++strokeColorsIndex % colors.length],
//       );
//     });
//   }

//   void _changeStrokeWidth(CircleId circleId) {
//     final Circle circle = circles[circleId]!;
//     setState(() {
//       circles[circleId] = circle.copyWith(
//         strokeWidthParam: widths[++widthsIndex % widths.length],
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final CircleId? selectedId = selectedCircle;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Center(
//           child: SizedBox(
//             width: 350.0,
//             height: 300.0,
//             child: GoogleMap(
//               initialCameraPosition: const CameraPosition(
//                 target: LatLng(52.4478, -3.5402),
//                 zoom: 7.0,
//               ),
//               circles: Set<Circle>.of(circles.values),
//               onMapCreated: _onMapCreated,
//             ),
//           ),
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         TextButton(
//                           onPressed: _add,
//                           child: const Text('add'),
//                         ),
//                         TextButton(
//                           onPressed: (selectedId == null)
//                               ? null
//                               : () => _remove(selectedId),
//                           child: const Text('remove'),
//                         ),
//                         TextButton(
//                           onPressed: (selectedId == null)
//                               ? null
//                               : () => _toggleVisible(selectedId),
//                           child: const Text('toggle visible'),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: <Widget>[
//                         TextButton(
//                           onPressed: (selectedId == null)
//                               ? null
//                               : () => _changeStrokeWidth(selectedId),
//                           child: const Text('change stroke width'),
//                         ),
//                         TextButton(
//                           onPressed: (selectedId == null)
//                               ? null
//                               : () => _changeStrokeColor(selectedId),
//                           child: const Text('change stroke color'),
//                         ),
//                         TextButton(
//                           onPressed: (selectedId == null)
//                               ? null
//                               : () => _changeFillColor(selectedId),
//                           child: const Text('change fill color'),
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   LatLng _createCenter() {
//     final double offset = _circleIdCounter.ceilToDouble();
//     return _createLatLng(51.4816 + offset * 0.2, -3.1791);
//   }

//   LatLng _createLatLng(double lat, double lng) {
//     return LatLng(lat, lng);
//   }
// }

// abstract class GoogleMapExampleAppPage extends StatelessWidget {
//   const GoogleMapExampleAppPage(this.leading, this.title, {Key? key})
//       : super(key: key);

//   final Widget leading;
//   final String title;
// }

// class AnimateCameraPage extends GoogleMapExampleAppPage {
//   const AnimateCameraPage({Key? key})
//       : super(const Icon(Icons.map), 'Camera control, animated', key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const AnimateCamera();
//   }
// }

// class AnimateCamera extends StatefulWidget {
//   const AnimateCamera({Key? key}) : super(key: key);
//   @override
//   State createState() => AnimateCameraState();
// }

// class AnimateCameraState extends State<AnimateCamera> {
//   GoogleMapController? mapController;

//   // ignore: use_setters_to_change_properties
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Center(
//           child: SizedBox(
//             width: 300.0,
//             height: 200.0,
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition:
//                   const CameraPosition(target: LatLng(0.0, 0.0)),
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.newCameraPosition(
//                         const CameraPosition(
//                           bearing: 270.0,
//                           target: LatLng(51.5160895, -0.1294527),
//                           tilt: 30.0,
//                           zoom: 17.0,
//                         ),
//                       ),
//                     );
//                   },
//                   child: const Text('newCameraPosition'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.newLatLng(
//                         const LatLng(56.1725505, 10.1850512),
//                       ),
//                     );
//                   },
//                   child: const Text('newLatLng'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.newLatLngBounds(
//                         LatLngBounds(
//                           southwest: const LatLng(-38.483935, 113.248673),
//                           northeast: const LatLng(-8.982446, 153.823821),
//                         ),
//                         10.0,
//                       ),
//                     );
//                   },
//                   child: const Text('newLatLngBounds'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.newLatLngZoom(
//                         const LatLng(37.4231613, -122.087159),
//                         11.0,
//                       ),
//                     );
//                   },
//                   child: const Text('newLatLngZoom'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.scrollBy(150.0, -225.0),
//                     );
//                   },
//                   child: const Text('scrollBy'),
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.zoomBy(
//                         -0.5,
//                         const Offset(30.0, 20.0),
//                       ),
//                     );
//                   },
//                   child: const Text('zoomBy with focus'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.zoomBy(-0.5),
//                     );
//                   },
//                   child: const Text('zoomBy'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.zoomIn(),
//                     );
//                   },
//                   child: const Text('zoomIn'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.zoomOut(),
//                     );
//                   },
//                   child: const Text('zoomOut'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     mapController?.animateCamera(
//                       CameraUpdate.zoomTo(16.0),
//                     );
//                   },
//                   child: const Text('zoomTo'),
//                 ),
//               ],
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

// final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
//   // const MapUiPage(),
//   // const MapCoordinatesPage(),
//   // const MapClickPage(),
//   const AnimateCameraPage(),
//   // const MoveCameraPage(),
//   const PlaceMarkerPage(),

//   const MarkerIconsPage(),
//   // const ScrollingMapPage(),
//   // const PlacePolylinePage(),
//   // const PlacePolygonPage(),
//   const PlaceCirclePage(),
//   // const PaddingPage(),
//   // const SnapshotPage(),
//   // const LiteModePage(),
//   // const TileOverlayPage(),
// ];

// /// MapsDemo is the Main Application.
// class MapsDemo extends StatelessWidget {
//   /// Default Constructor
//   const MapsDemo({Key? key}) : super(key: key);

//   void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: Text(page.title)),
//               body: page,
//             )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('GoogleMaps examples')),
//       body: ListView.builder(
//         itemCount: _allPages.length,
//         itemBuilder: (_, int index) => ListTile(
//           leading: _allPages[index].leading,
//           title: Text(_allPages[index].title),
//           onTap: () => _pushPage(context, _allPages[index]),
//         ),
//       ),
//     );
//   }
// }

// void main() {

//   runApp(const MaterialApp(home: MapsDemo()));
// }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:service_app/Backend/DatabaseService/datastoreService.dart';



// // void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(lat, long),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(lat, long),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   final LatLng _kMapCenter = LatLng(lat, long);
//   BitmapDescriptor? _markerIcon;

//   Marker _createMarker() {
//     if (_markerIcon != null) {
//       return Marker(
//         markerId: const MarkerId('marker_1'),
//         position: _kMapCenter,
//         icon: _markerIcon!,
//       );
//     } else {
//       return Marker(
//         markerId: MarkerId('marker_1'),
//         position: _kMapCenter,
//       );
//     }
//   }

//   Future<void> _createMarkerImageFromAsset(BuildContext context) async {
//     if (_markerIcon == null) {
//       final ImageConfiguration imageConfiguration =
//           createLocalImageConfiguration(context, size: const Size.square(48));
//       BitmapDescriptor.fromAssetImage(
//               imageConfiguration, 'assets/red_square.png')
//           .then(_updateBitmap);
//     }
//   }

//   void _updateBitmap(BitmapDescriptor bitmap) {
//     setState(() {
//       _markerIcon = bitmap;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: GoogleMap(
//         markers: <Marker>{_createMarker()},
//         mapType: MapType.satellite,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
   
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

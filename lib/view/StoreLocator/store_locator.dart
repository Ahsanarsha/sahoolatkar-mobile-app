import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saholatkar/Repositories/profileMenu/profile_menu_repo.dart';

import '../../controller/ProfileMenu/AccountLevel/StoreLocator/store_locator_controller.dart';
import '../../model/store/StoreLocator.dart';

class StoreLocator extends StatefulWidget {
  const StoreLocator({Key? key}) : super(key: key);

  @override
  State<StoreLocator> createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
  final StoreLocatorController storeLocatorController = Get.find();
  late GoogleMapController _googleMapController;
  final apiClient = ProfileMenuRepo();
  StoreLocatorModel storeLocatorModel = StoreLocatorModel();
  List<StoreLocatorModel> storeLocations = [];
  late BitmapDescriptor mapMarkerIcon;
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: width + 10);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setMarkerIcon() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/marker.png', 100);
    mapMarkerIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _googleMapController = controller;
  }

  LocationPermission? permission;
  var lat = 31.50467120;
  var lng = 74.35334080;

  final List<Marker> _marker = [];
  final List<Marker> _list = [];

  Future<dynamic> getStoreLocations() async {
    await apiClient.getStoreLocations().then((response) async {
      print('location response ${response}');
      if (response != null) {
        storeLocatorModel = StoreLocatorModel.fromJson(json.decode(response));
        storeLocations = [storeLocatorModel];
        loadMarkers(storeLocations);
      }
    });
  }

  loadMarkers(List<StoreLocatorModel> storeLocations) {
    print(json.encode(storeLocations[0]));
    for (var i =0; i<storeLocations[0].data!.length; i++) {
      var lat = double.parse(storeLocations[0].data![i].latitude!);
      var lng = double.parse(storeLocations[0].data![i].longitude!);
      var resultedMarker = Marker(
          markerId: MarkerId(storeLocations[0].data![i].id.toString()),
          position: LatLng(lat, lng),
          icon: mapMarkerIcon,
          infoWindow: InfoWindow(title: storeLocations[0].data![i].name));
      _list.add(resultedMarker);
    }
    _marker.addAll(_list);
    print('-----------------------');
    print(_marker.length);
    setState(() {});
  }

  getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
    print(position);
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 13.0,
        ),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
    setMarkerIcon();
    WidgetsBinding.instance.addPostFrameCallback((_) => getStoreLocations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lng),
            zoom: 7.0,
          ),
          myLocationEnabled: true,
          markers: Set<Marker>.of(_marker),
          onMapCreated: _onMapCreated),
    );
  }
}

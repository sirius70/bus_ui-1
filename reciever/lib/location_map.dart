import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() => runApp(const Location());

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late IO.Socket socket;
  late Map<MarkerId, Marker> _markers;
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _cameraPosition =
      const CameraPosition(target: const LatLng(22.7674, 88.3883), zoom: 14);

  @override
  void initState() {
    super.initState();
    permission();
    initSocket();
    _markers = <MarkerId, Marker>{};
    _markers.clear();
  }

  Future<void> initSocket() async {
    try {
      //TODO: add uri
      socket = IO.io("http://139.59.7.189:49154", <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true
      });
      socket.connect();

      socket.onConnect((data) => {print('Connect: ${socket.id}')});
      socket.on("123", (data) async {
        var latLng = await jsonDecode(data);
        print("data:${latLng}");
        print("lat:${latLng["lat"]}");

        GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(24.138250, 79.594254), zoom: 19)));
        //
        var image = await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/dest_marker.png');

        Marker marker = Marker(
            markerId: const MarkerId("ID"),
            icon: image,
            position: LatLng(24.138250, 79.594254));
        setState(() {
          _markers[MarkerId("ID")] = marker;
        });
      });
    } catch (e) {
      print("Error:${e.toString()}");
    }
  }

  // Future<void> initSocket() async {
  //   try {
  //     socket = IO.io('http://139.59.7.189:49154', <String, dynamic>{
  //       'transports': ['web socket'],
  //       'autoConnect': true
  //     });
  //     socket.connect();
  //     socket.onConnect((data) => {
  //
  //       print('Connect: ${socket.id}')});
  //     socket.on("123", (data) async {
  //       var latLng = jsonDecode(data);
  //       // GoogleMapController controller = await _controller.future;
  //       // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       //     target: LatLng(latLng["lat"], latLng["lng"]), zoom: 19)));
  //       //
  //       // var image = await BitmapDescriptor.fromAssetImage(
  //       //     const ImageConfiguration(), 'assets/dest_marker.png');
  //       //
  //       // Marker marker = Marker(
  //       //     markerId: const MarkerId("ID"),
  //       //     icon: image,
  //       //     position: LatLng(latLng["lat"], latLng["lng"]));
  //       // setState(() {
  //       //   _markers[MarkerId("ID")] = marker ;
  //       // });
  //     });
  //   } catch (e) {
  //     print("Error:${e.toString()}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _cameraPosition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_markers.values),
        ),
      ),
    );
  }

  permission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.locationWhenInUse.request();
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }
  }
}

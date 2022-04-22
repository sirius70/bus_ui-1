import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() => runApp(const Location());

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late IO.Socket socket;
  late Map<Marker, MarkerId> _markers;
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _cameraPosition =
      const CameraPosition(target: const LatLng(23.15655, 28.3255), zoom: 14);

  @override
  void initState() {
    super.initState();
    _markers = <Marker, MarkerId>{};
    _markers.clear();
  }

  Future<void> initSocket() async {
    try {
      socket = IO.io('http://139.59.7.189:49154', <String, dynamic>{
        'transports': ['web socket'],
        'autoConnect': true
      });
      socket.connect();
      socket.on("position--change", (data) async {
        var LatLng = jsonDecode(data);
        GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(LatLng["lat"], LatLng["lng"]), zoom: 19)));

        var image = await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/dest_marker.png');

        Marker marker = Marker(
            markerId: const MarkerId("ID"),
            icon: image,
            position: LatLng(LatLng["lat"], LatLng["lng"]));
        setState(() {
          _markers[MarkerId("ID")] = marker as MarkerId;
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markers.values),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() => runApp(Homepage());

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late IO.Socket socket;
  double? latitude;
  double? longitude;
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initSocket();
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
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Form(
                key: globalKey,
                child: Column(
                  children: [
                    TextFormField(
                      // keyname: latitude,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (onSaved) {
                        latitude = double.parse(onSaved!);
                      },
                      decoration: InputDecoration(
                          hintText: 'latitude',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (onSaved) {
                        longitude = double.parse(onSaved!);
                      },
                      decoration: InputDecoration(
                          hintText: 'longitude',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    TextButton(
                      child: Text('Send'),
                      onPressed: () {
                        if (validateandSave()) {
                          var coords = {"lat": latitude, "long": longitude};

                          socket.emit("position-changed", jsonEncode(coords));
                        }
                      },
                    )
                  ],
                ))));
  }

  bool validateandSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }
}

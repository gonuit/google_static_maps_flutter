import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google static map demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaticMap(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        scaleToDevicePixelRatio: true,
        googleApiKey: "<GOOGLE_API_KEY>",
        markers: <Marker>[
          Marker(
            color: Colors.lightBlue,
            label: "A",
            locations: [
              Location(-3.1178833, -60.0029284),
              Location(-3.1467579, -59.8753814),
            ],
          ),
          Marker.custom(
            anchor: MarkerAnchor.bottom,
            icon: "https://goo.gl/1oTJ9Y",
            locations: [
              Location(-3.1694166, -60.1041517),
            ],
          )
        ],
      ),
    );
  }
}

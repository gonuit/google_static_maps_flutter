# example

![Screenshot](../readme/screen.png)

```dart
import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google static map demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

final retroMapStyle = [
  const MapStyle(
    element: StyleElement.geometry,
    rules: [
      StyleRule.color(Color(0xffebe3cd)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text,
    rules: const [
      StyleRule.color(Color(0xFF523735)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.stroke,
    rules: const [
      StyleRule.color(Color(0xFFf5f1e6)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.stroke,
    feature: StyleFeature.administrative,
    rules: const [
      StyleRule.color(Color(0xFFc9b2a6)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.stroke,
    feature: StyleFeature.administrative.landParcel,
    rules: const [
      StyleRule.color(Color(0xFFdcd2be)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.administrative.landParcel,
    rules: const [
      StyleRule.color(Color(0xFFae9e90)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.landscape.natural,
    rules: const [
      StyleRule.color(Color(0xFFdfd2ae)),
    ],
  ),
  const MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.poi,
    rules: [
      StyleRule.color(Color(0xFFdfd2ae)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.poi,
    rules: const [
      StyleRule.color(Color(0xFF93817c)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.fill,
    feature: StyleFeature.poi.park,
    rules: const [
      StyleRule.color(Color(0xFFa5b076)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.poi.park,
    rules: const [
      StyleRule.color(Color(0xFF447530)),
    ],
  ),
  const MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.road,
    rules: [
      StyleRule.color(Color(0xFFf5f1e6)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.road.arterial,
    rules: const [
      StyleRule.color(Color(0xFFfdfcf8)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.road.highway,
    rules: const [
      StyleRule.color(Color(0xFFf8c967)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.stroke,
    feature: StyleFeature.road.highway,
    rules: const [
      StyleRule.color(Color(0xFFe9bc62)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.road.highway.controlledAccess,
    rules: const [
      StyleRule.color(Color(0xFFe98d58)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.stroke,
    feature: StyleFeature.road.highway.controlledAccess,
    rules: const [
      StyleRule.color(Color(0xFFdb8555)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.road.local,
    rules: const [
      StyleRule.color(Color(0xFF806b63)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.transit.line,
    rules: const [
      StyleRule.color(Color(0xFFdfd2ae)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.transit.line,
    rules: const [
      StyleRule.color(Color(0xFF8f7d77)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.stroke,
    feature: StyleFeature.transit.line,
    rules: const [
      StyleRule.color(Color(0xFFebe3cd)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry,
    feature: StyleFeature.transit.station,
    rules: const [
      StyleRule.color(Color(0xFFdfd2ae)),
    ],
  ),
  MapStyle(
    element: StyleElement.geometry.fill,
    feature: StyleFeature.water,
    rules: const [
      StyleRule.color(Color(0xFFb9d3c2)),
    ],
  ),
  MapStyle(
    element: StyleElement.labels.text.fill,
    feature: StyleFeature.water,
    rules: const [
      StyleRule.color(Color(0xFF92998d)),
    ],
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaticMap(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        scaleToDevicePixelRatio: true,
        googleApiKey: "<REPLACE-WITH-GOOGLE-API-KEY>",
        visible: const [
          GeocodedLocation.address('Santa Monica Pier'),
        ],
        styles: retroMapStyle,
        paths: <Path>[
          const Path(
            color: Colors.blue,
            // encoded: true,
            points: [
              GeocodedLocation.address('Santa Monica Pier'),
              Location(34.011395, -118.494961),
              Location(34.011921, -118.493360),
              Location(34.012471, -118.491884),
              Location(34.012710, -118.489420),
              Location(34.014294, -118.486595),
              Location(34.016630, -118.482920),
              Location(34.018899, -118.480087),
              Location(34.021314, -118.477136),
              Location(34.022769, -118.474901),
            ],
          ),
          Path.circle(
            center: const Location(34.005641, -118.490229),
            color: Colors.green.withOpacity(0.8),
            fillColor: Colors.green.withOpacity(0.4),
            radius: 200, // meters
          ),
          const Path(
            encoded: true,
            points: [
              Location(34.016839, -118.488240),
              Location(34.019498, -118.491439),
              Location(34.024106, -118.485734),
              Location(34.021486, -118.482682),
              Location(34.016839, -118.488240),
            ],
            fillColor: Colors.black45,
            color: Colors.black,
          )
        ],
        zoom: 14,
        markers: const <Marker>[
          Marker(
            color: Colors.amber,
            label: "X",
            locations: [
              GeocodedLocation.address("Santa Monica Pier"),
              GeocodedLocation.latLng(34.012849, -118.501478),
            ],
          ),
          Marker.custom(
            anchor: MarkerAnchor.center,
            icon: "https://goo.gl/1oTJ9Y",
            locations: [
              Location(34.012343, -118.482998),
            ],
          ),
          Marker(
            locations: [
              Location(34.006618, -118.500901),
            ],
            color: Colors.cyan,
            label: "W",
          )
        ],
      ),
    );
  }
}
```

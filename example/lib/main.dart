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
        googleApiKey: "<GOOGLE-API-KEY>",
        styles: <MapStyle>[
          MapStyle(
            element: StyleElement.geometry.fill,
            feature: StyleFeature.landscape.natural,
            rules: <StyleRule>[
              StyleRule.color(Colors.grey),
            ],
          ),
          MapStyle(
            feature: StyleFeature.water,
            rules: <StyleRule>[
              StyleRule.color(Colors.grey),
              StyleRule.lightness(-30),
            ],
          )
        ],
        paths: <Path>[
          Path(
            weight: 2,
            color: Colors.blue,
            fillColor: Colors.purple.withOpacity(0.5),
            points: <Location>[
              Location(-3.220028, -59.924832),
              Location(-3.234028, -59.964832),
              Location(-3.265628, -59.994832),
              Location(-3.261128, -59.947832),
              Location(-3.216728, -59.895832),
              Location(-3.220028, -59.924832),
            ],
          ),
          Path(
            weight: 3,
            color: Colors.blue,
            points: <Location>[
              Location(-3.352538, -60.163816),
              Location(-3.314760, -60.050712),
              Location(-3.364583, -59.942379),
              Location(-3.268667, -59.901430),
              Location(-3.198791, -59.876131),
            ],
          )
        ],
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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const _mockGoogleApiKey = "GOOGLE_API_KEY";

  test("Build link correctly", () {
    const controller = StaticMapController(
        googleApiKey: _mockGoogleApiKey,
        height: 300,
        width: 200,
        center: GeocodedLocation.latLng(20, 30),
        zoom: 10,
        format: MapImageFormat.gif,
        language: "PL",
        scale: MapScale.scale2,
        maptype: StaticMapType.satellite,
        region: "PL",
        signature: "APP",
        mapId: 'mockedID');
    expect(
      controller.url.toString(),
      equals(
        "https://maps.googleapis.com/maps/api/staticmap?"
        "key=GOOGLE_API_KEY"
        "&size=200x300"
        "&center=20.0%2C30.0"
        "&language=PL"
        "&maptype=satellite"
        "&zoom=10"
        "&format=gif"
        "&scale=2"
        "&region=PL"
        "&map_id=mockedID",
      ),
    );
  });

  test("Builds link with markers correctly", () {
    const controller = StaticMapController(
      googleApiKey: _mockGoogleApiKey,
      height: 300,
      width: 200,
      visible: [
        GeocodedLocation.address('Example address somewhere'),
        GeocodedLocation.address('Example address 12')
      ],
      markers: <Marker>[
        Marker(
          color: Color(0xFFFF0000),
          label: "a",
          size: MarkerSize.mid,
          locations: <Location>[
            Location(10, 20),
            Location(20, 30),
            Location(20, 30),
          ],
        ),
      ],
      format: MapImageFormat.gif,
      language: "PL",
      maptype: StaticMapType.roadmap,
      region: "PL",
      signature: "APP",
    );
    expect(
      controller.url.toString(),
      equals(
        "https://maps.googleapis.com/maps/api/staticmap?"
        "key=GOOGLE_API_KEY"
        "&size=200x300"
        "&language=PL"
        "&maptype=roadmap"
        "&format=gif"
        "&region=PL"
        // marker styles
        "&markers=size%3Amid%7Clabel%3AA%7Ccolor%3A0xff0000"
        // marker locations
        "%7C10.0%2C20.0%7C20.0%2C30.0%7C20.0%2C30.0"
        "&visible=Example+address+somewhere"
        "&visible=Example+address+12",
      ),
    );
  });
  test("Correctly calculates scale based on device pixel ratio", () {
    for (final value in [
      [0.05, MapScale.scale1],
      [1.00, MapScale.scale1],
      [1.01, MapScale.scale2],
      [2.00, MapScale.scale2],
      [2.01, MapScale.scale4],
      [3.01, MapScale.scale4],
      [3.99, MapScale.scale4],
      [4.01, MapScale.scale4],
      [9.01, MapScale.scale4],
    ]) {
      expect(
        getScaleForDevicePixelRatio(value[0] as double),
        equals(value[1]),
      );
    }
  });

  test("Encodes custom marker correctly", () {
    const marker = Marker.custom(
      anchor: MarkerAnchor.top,
      icon: "www.example.com/image",
      locations: [
        Location(20, 10),
        Location(20, 20),
      ],
    );

    expect(
      marker.toUrlString(),
      equals(
        "anchor:top"
        "|icon:www.example.com/image"
        "|20.0,10.0"
        "|20.0,20.0",
      ),
    );

    const marker1 = Marker.custom(
      anchor: MarkerAnchor(64, 0),
      icon: "www.example.com/image",
      locations: [
        Location(20, 10),
      ],
    );

    expect(
      marker1.toUrlString(),
      equals(
        "anchor:64, 0"
        "|icon:www.example.com/image"
        "|20.0,10.0",
      ),
    );
  });

  test("Build link with custom markers correctly", () {
    const controller = StaticMapController(
      googleApiKey: _mockGoogleApiKey,
      height: 200,
      width: 200,
      markers: [
        Marker.custom(icon: "www.example.com/image", locations: [
          Location(20, 10),
          Location(20, 20),
        ])
      ],
    );

    expect(
      controller.url.toString(),
      equals(
        "https://maps.googleapis.com/maps/api/staticmap"
        "?key=GOOGLE_API_KEY"
        "&size=200x200"
        "&markers="
        "icon%3Awww.example.com%2Fimage"
        "%7C20.0%2C10.0"
        "%7C20.0%2C20.0",
      ),
    );
  });

  test(
      "Throws exception when mapId argument is "
      "provided together with styles.", () {
    expect(
      () => StaticMapController(
        googleApiKey: _mockGoogleApiKey,
        height: 200,
        width: 200,
        center: const GeocodedLocation.latLng(-3.1467579, -59.8753814),
        zoom: 10,
        mapId: 'mockedID',
        styles: [
          MapStyle(
            feature: StyleFeature.poi.government,
            element: StyleElement.geometry.fill,
            rules: const [
              StyleRule.visibility(VisibilityRule.simplified),
              StyleRule.color(Colors.green),
            ],
          ),
        ],
      ),
      throwsA(isA<AssertionError>()),
    );
  });
}

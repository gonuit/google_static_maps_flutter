import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  const _mockedGoogleApiKey = "GOOGLE_API_KEY";
  test("Create styles link correctly", () {
    final controller = StaticMapController(
        googleApiKey: _mockedGoogleApiKey,
        width: 200,
        height: 300,
        center: Location(10, 20),
        zoom: 5,
        styles: [
          MapStyle(
            element: StyleElement.geometry,
            rules: [
              StyleRule.color(Colors.red),
              StyleRule.lightness(20),
              StyleRule.saturation(-20),
              StyleRule.visibility(VisibilityRule.on),
            ],
          ),
          MapStyle(
            element: StyleElement.geometry.fill,
            rules: [
              StyleRule.visibility(VisibilityRule.simplified),
              StyleRule.color(Colors.green),
            ],
          ),
        ]);
    expect(
      controller.url.toString(),
      equals(
        "https://maps.googleapis.com/maps/api/staticmap"
        "?key=GOOGLE_API_KEY"
        "&size=200x300"
        "&zoom=5"
        "&style=geometry"
        "%7Ccolor%3A0xf44336"
        "%7Clightness%3A20"
        "%7Csaturation%3A-20"
        "%7Cvisibility%3Aon"
        "&style=geometry.fill"
        "%7Cvisibility%3Asimplified"
        "%7Ccolor%3A0x4caf50",
      ),
    );
  });
}

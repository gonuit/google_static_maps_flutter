import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:google_static_maps_controller/src/data/geocoded_location.dart';

void main() {
  const _mockedGoogleApiKey = "GOOGLE_API_KEY";
  test("Create styles link correctly", () {
    final controller = StaticMapController(
        googleApiKey: _mockedGoogleApiKey,
        width: 200,
        height: 300,
        center: GeocodedLocation.latLng(-3.1467579, -59.8753814),
        zoom: 10,
        styles: [
          MapStyle(
            element: StyleElement.geometry,
            rules: [
              StyleRule.hue(Colors.red),
              StyleRule.lightness(20),
              StyleRule.saturation(-20),
              StyleRule.visibility(VisibilityRule.on),
            ],
          ),
          MapStyle(
            feature: StyleFeature.poi.government,
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
        "&center=-3.1467579%2C-59.87538140000001"
        "&zoom=10"
        "&style=element%3Ageometry"
        "%7Chue%3A0xf44336"
        "%7Clightness%3A20"
        "%7Csaturation%3A-20"
        "%7Cvisibility%3Aon"
        "&style=feature%3Apoi.government"
        "%7Celement%3Ageometry.fill"
        "%7Cvisibility%3Asimplified"
        "%7Ccolor%3A0x4caf50",
      ),
    );
  });
}

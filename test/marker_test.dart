import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  test(
      "Throws error when marker toUrlString method is called for "
      "marker with no locations provided.", () {
    var marker = const Marker(
      locations: <Location>[],
    );

    expect(
      () => marker.toUrlString(),
      throwsA(isA<StateError>()),
    );

    marker = const Marker.custom(
      icon: "http://example.com/icon.png",
      locations: <Location>[],
    );

    expect(
      () => marker.toUrlString(),
      throwsA(isA<StateError>()),
    );
  });
}

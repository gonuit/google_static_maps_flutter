import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
      "Throws error when marker toUrlString method is called for "
      "marker with no locations provided.", () {
    Marker marker = Marker(
      locations: <Location>[],
    );

    expect(
      () => marker.toUrlString(),
      throwsA(isA<StateError>()),
    );

    marker = Marker.custom(
      icon: "http://example.com/icon.png",
      locations: <Location>[],
    );

    expect(
      () => marker.toUrlString(),
      throwsA(isA<StateError>()),
    );
  });
}

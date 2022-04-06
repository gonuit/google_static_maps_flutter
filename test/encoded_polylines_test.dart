import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:google_static_maps_controller/src/utils/polyline_encoder.dart';

void main() {
  test("Polylines encoding works correctly.", () {
    final precalculated = <double, String>{
      -179.9832104: '`~oia@',
      38.5: '_p~iF',
      -120.2: '~ps|U',
      40.7: '_flwF',
      -120.95: 'n`faV',
      43.252: '_t~fG',
      -126.453: 'fzxbW',
    };

    for (final entry in precalculated.entries) {
      expect(PolylineEncoder.encode(entry.key), equals(entry.value));
    }
  });

  test("Polylines path encoding works correctly.", () {
    final data = PolylineEncoder.encodePath([
      Location(38.5, -120.2),
      Location(40.7, -120.95),
      Location(43.252, -126.453),
    ]);
    expect(data, equals('_p~iF~ps|U_ulLnnqC_mqNvxq`@'));
  });
}

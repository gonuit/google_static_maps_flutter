import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:google_static_maps_controller/src/data/geocoded_location.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const _mockGoogleApiKey = "GOOGLE_API_KEY";

  test("Builds url with multiple paths correctly", () {
    const controller = StaticMapController(
      googleApiKey: _mockGoogleApiKey,
      height: 300,
      width: 200,
      zoom: 10,
      center: const GeocodedLocation.latLng(20, 30),
      paths: [
        Path(
          color: Colors.red,
          weight: 10,
          geodesic: true,
          fillColor: Color(0xAAFF0000),
          points: <Location>[
            Location(10, 10),
            Location(10, -10),
            Location(-10, -10),
            Location(-10, 10),
          ],
        ),
        Path(
          points: <Location>[
            Location(10, 10),
            Location(-10, 10),
          ],
        )
      ],
    );

    expect(
      controller.url.toString(),
      equals(
        "https://maps.googleapis.com/maps/api/staticmap"
        "?key=GOOGLE_API_KEY"
        "&size=200x300"
        "&center=20.0%2C30.0"
        "&zoom=10"
        "&path=weight%3A10%7Ccolor%3A0xF44336FF%7Cgeodesic%3Atrue%7Cfillcolor%3A0xFF0000AA%7C10.0%2C10.0%7C10.0%2C-10.0%7C-10.0%2C-10.0%7C-10.0%2C10.0"
        "&path=10.0%2C10.0%7C-10.0%2C10.0",
      ),
    );
  });

  test("geodesic property works correctly", () {
    Path path = Path(
      geodesic: true,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('geodesic:true|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      geodesic: false,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('geodesic:false|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0,10.0|-10.0,10.0'),
    );
  });

  test("geodesic property works correctly", () {
    Path path = Path(
      geodesic: true,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('geodesic:true|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      geodesic: false,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('geodesic:false|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0,10.0|-10.0,10.0'),
    );
  });

  test("color property works correctly", () {
    Path path = Path(
      color: Color(0xFFFF0000),
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('color:0xFF0000FF|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      color: Color(0xAAFF0000),
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('color:0xFF0000AA|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0,10.0|-10.0,10.0'),
    );
  });

  test("fillColor property works correctly", () {
    Path path = Path(
      fillColor: Color(0xFFFF0000),
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('fillcolor:0xFF0000FF|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      fillColor: Color(0xAAFF0000),
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('fillcolor:0xFF0000AA|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0,10.0|-10.0,10.0'),
    );
  });

  test("weight property works correctly", () {
    Path path = Path(
      weight: 2,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('weight:2|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      weight: 4,
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('weight:4|10.0,10.0|-10.0,10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0,10.0|-10.0,10.0'),
    );
  });
  test("Encoded property works correctly for the Path constructor.", () {
    final notEncodedPath = Path(
      weight: 2,
      encoded: false,
      points: <Location>[
        Location(38.5, -120.2),
        Location(40.7, -120.95),
        Location(43.252, -126.453),
      ],
    );

    expect(
      notEncodedPath.toUrlString(),
      equals('weight:2|38.5,-120.2|40.7,-120.95|43.252,-126.453'),
    );

    final encodedPath = Path(
      weight: 2,
      encoded: true,
      points: <Location>[
        Location(38.5, -120.2),
        Location(40.7, -120.95),
        Location(43.252, -126.453),
      ],
    );

    expect(
      encodedPath.toUrlString(),
      equals('weight:2|enc:_p~iF~ps|U_ulLnnqC_mqNvxq`@'),
    );
  });
  test("Encoded property works correctly for the Path.circle constructor.", () {
    final notEncodedPath = Path.circle(
      weight: 2,
      radius: 5000,
      detail: 10,
      encoded: false,
      center: Location(38.5, -120.2),
    );

    expect(
      notEncodedPath.toUrlString(),
      equals(
        'weight:2|'
        '38.54496608029594,-120.2|'
        '38.53637347030108,-120.16621073250631|'
        '38.51388258416807,-120.14534489518861|'
        '38.48609202568267,-120.14536597791356|'
        '38.46361683151974,-120.16624484509843|'
        '38.455033919704064,-120.2|'
        '38.46361683151974,-120.23375515490157|'
        '38.48609202568267,-120.25463402208646|'
        '38.51388258416807,-120.2546551048114|'
        '38.53637347030108,-120.2337892674937|'
        '38.54496608029594,-120.2',
      ),
    );

    final encodedPath = Path.circle(
      weight: 2,
      radius: 5000,
      detail: 10,
      encoded: true,
      center: Location(38.5, -120.2),
    );

    expect(
      encodedPath.toUrlString(),
      equals(
        'weight:2|'
        'enc:aigjF~ps|Utt@erEpkCmaCtlDBnkCnaCrt@~q'
        'Est@~qEokCnaCulDBqkCmaCut@erE',
      ),
    );
  });

  test(
      "Throws error when path toUrlString method is called for "
      "path with less than 2 points.", () {
    Path path = Path(
      points: <Location>[
        Location(10, 10),
      ],
    );

    expect(
      () => path.toUrlString(),
      throwsA(isA<StateError>()),
    );

    path = Path(
      points: <Location>[],
    );

    expect(
      () => path.toUrlString(),
      throwsA(isA<StateError>()),
    );
  });
}

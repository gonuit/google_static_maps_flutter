import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const _mockGoogleApiKey = "GOOGLE_API_KEY";

  test("Builds url with multiple paths correctly", () {
    const controller = StaticMapController(
      googleApiKey: _mockGoogleApiKey,
      height: 300,
      width: 200,
      zoom: 10,
      center: const Location(20, 30),
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
        "&center=20.0%2C+30.0"
        "&zoom=10"
        "&path=weight%3A10%7Ccolor%3A0xF44336FF%7Cgeodesic%3Atrue%7Cfillcolor%3A0xFF0000AA%7C10.0%2C+10.0%7C10.0%2C+-10.0%7C-10.0%2C+-10.0%7C-10.0%2C+10.0"
        "&path=10.0%2C+10.0%7C-10.0%2C+10.0",
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
      equals('geodesic:true|10.0, 10.0|-10.0, 10.0'),
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
      equals('geodesic:false|10.0, 10.0|-10.0, 10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0, 10.0|-10.0, 10.0'),
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
      equals('geodesic:true|10.0, 10.0|-10.0, 10.0'),
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
      equals('geodesic:false|10.0, 10.0|-10.0, 10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0, 10.0|-10.0, 10.0'),
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
      equals('color:0xFF0000FF|10.0, 10.0|-10.0, 10.0'),
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
      equals('color:0xFF0000AA|10.0, 10.0|-10.0, 10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0, 10.0|-10.0, 10.0'),
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
      equals('fillcolor:0xFF0000FF|10.0, 10.0|-10.0, 10.0'),
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
      equals('fillcolor:0xFF0000AA|10.0, 10.0|-10.0, 10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0, 10.0|-10.0, 10.0'),
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
      equals('weight:2|10.0, 10.0|-10.0, 10.0'),
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
      equals('weight:4|10.0, 10.0|-10.0, 10.0'),
    );

    path = Path(
      points: <Location>[
        Location(10, 10),
        Location(-10, 10),
      ],
    );

    expect(
      path.toUrlString(),
      equals('10.0, 10.0|-10.0, 10.0'),
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

import 'package:flutter_test/flutter_test.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

void main() {
  group("Operators", () {
    test("- works correctly.", () {
      const a = Location(10, 10);
      const b = Location(5, 5);
      expect(a - 5, const Location(5, 5));
      expect(a - b, const Location(5, 5));
      expect(b - a, const Location(-5, -5));
    });
    test("+ works correctly.", () {
      const a = Location(10, 10);
      const b = Location(5, 5);
      expect(a + 5, const Location(15, 15));
      expect(a + b, const Location(15, 15));
      expect(b + a, const Location(15, 15));
    });

    test("/ works correctly.", () {
      const a = Location(10, 10);
      const b = Location(5, 5);
      expect(a / 5, const Location(2, 2));
      expect(a / b, const Location(2, 2));
      expect(b / a, const Location(0.5, 0.5));
    });

    test("* works correctly.", () {
      const a = Location(10, 10);
      const b = Location(5, 5);
      expect(a * 5, const Location(50, 50));
      expect(a * b, const Location(50, 50));
      expect(b * a, const Location(50, 50));
    });

    test("== works correctly.", () {
      const a = Location(10, 10);
      const b = Location(5, 5);

      expect(a == b, isFalse);
      expect(b == a, isFalse);
      expect(a == (b + b), isTrue);
      expect((b + b) == a, isTrue);
      expect(a == (b * 2), isTrue);
      expect((b * 2) == a, isTrue);
      expect(a == (b * 3), isFalse);
    });
  });

  test("Encoding works correctly", () {
    const location = Location(38.5, -120.2);
    expect(location.encode(), equals('_p~iF~ps|U'));
  });
}

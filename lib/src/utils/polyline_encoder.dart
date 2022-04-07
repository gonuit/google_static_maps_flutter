part of google_static_maps_controller;

/// Utility class with implementation of
/// [Encoded Polyline Algorithm](https://developers.google.com/maps/documentation/utilities/polylinealgorithm).
class PolylineEncoder {
  const PolylineEncoder._();

  /// Values are summed with 63 (the ASCII character '?') before converting them into ASCII
  static const _questionMarkCharCode = 63;

  static String encodePath(List<Location> path) {
    var start = const Location(0, 0);
    final output = StringBuffer();
    for (final location in path) {
      final diff = location - start;
      encode(diff.latitude, output);
      encode(diff.longitude, output);
      start = location;
    }

    return output.toString();
  }

  static String encode(final double value, [StringBuffer? buffer]) {
    // The value must be multiplied by 1e5
    const factor = 100000;

    var transformedValue = (value * factor).round();
    var binary = transformedValue << 1;
    binary = value.isNegative ? ~binary : binary;

    final output = buffer ?? StringBuffer();

    while (binary >= 0x20) {
      output.write(
        String.fromCharCode((0x20 | (binary & 0x1f)) + _questionMarkCharCode),
      );
      binary = binary >> 5;
    }
    output.write(String.fromCharCode(binary + _questionMarkCharCode));

    return output.toString();
  }
}

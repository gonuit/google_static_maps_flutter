part of google_static_maps_controller;

@immutable
class Location implements EncodableUrlPart {
  const Location(double latitude, double longitude)
      : latitude =
            latitude < -90.0 ? -90.0 : (90.0 < latitude ? 90.0 : latitude),
        longitude = (longitude + 180.0) % 360.0 - 180.0;

  final double latitude;
  final double longitude;

  @override
  bool operator ==(Object object) =>
      object is Location &&
      object.latitude == latitude &&
      object.longitude == longitude;

  Location operator -(Object object) {
    if (object is num) {
      return Location(
        latitude - object,
        longitude - object,
      );
    } else if (object is Location) {
      return Location(
        latitude - object.latitude,
        longitude - object.longitude,
      );
    } else {
      throw UnsupportedError("Unsupported operation.");
    }
  }

  Location operator *(Object object) {
    if (object is num) {
      return Location(
        latitude * object,
        longitude * object,
      );
    } else if (object is Location) {
      return Location(
        latitude * object.latitude,
        longitude * object.longitude,
      );
    } else {
      throw UnsupportedError("Unsupported operation.");
    }
  }

  Location operator /(Object object) {
    if (object is num) {
      return Location(
        latitude / object,
        longitude / object,
      );
    } else if (object is Location) {
      return Location(
        latitude / object.latitude,
        longitude / object.longitude,
      );
    } else {
      throw UnsupportedError("Unsupported operation.");
    }
  }

  Location operator +(Object object) {
    if (object is num) {
      return Location(
        latitude + object,
        longitude + object,
      );
    } else if (object is Location) {
      return Location(
        latitude + object.latitude,
        longitude + object.longitude,
      );
    } else {
      throw UnsupportedError("Unsupported operation.");
    }
  }

  /// Encode this location using
  /// [Encoded Polyline Algorithm](https://developers.google.com/maps/documentation/utilities/polylinealgorithm).
  String encode() =>
      "${PolylinesEncoder.encode(latitude)}${PolylinesEncoder.encode(longitude)}";

  int get hashCode => hashValues(latitude, longitude);

  @override
  String toUrlString() {
    return "$latitude,$longitude";
  }

  @override
  String toString() => '$runtimeType($latitude, $longitude)';
}

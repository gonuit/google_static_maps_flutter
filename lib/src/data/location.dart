part of google_static_maps_controller;

class Location implements MapPart {
  const Location(double latitude, double longitude)
      : assert(latitude != null),
        assert(longitude != null),
        latitude =
            latitude < -90.0 ? -90.0 : (90.0 < latitude ? 90.0 : latitude),
        longitude = (longitude + 180.0) % 360.0 - 180.0;

  final double latitude;

  final double longitude;

  @override
  String toString() => '$runtimeType($latitude, $longitude)';

  @override
  bool operator ==(Object object) =>
      object is Location &&
      object.latitude == latitude &&
      object.longitude == longitude;

  int get hashCode => hashValues(latitude, longitude);

  @override
  String toUrlString() {
    // TODO: remove uneccessary space between lat nad lng, then update tests
    return "$latitude, $longitude";
  }
}

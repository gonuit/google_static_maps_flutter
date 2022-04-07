import 'package:google_static_maps_controller/google_static_maps_controller.dart';

/// The Maps Static API uses numbers (latitude and longitude values) or string
/// (address) to specify a location.
/// These values identify a geocoded location.
abstract class GeocodedLocation extends EncodableUrlPart {
  /// Most people don't speak in latitudes and longitudes;
  /// they denote locations using addresses. The process of turning an address
  /// into a geographic point is known as geocoding and the Maps Static API
  /// service can perform geocoding for you if you provide valid addresses.
  const factory GeocodedLocation.address(String address) = AddressPosition;

  /// Specify location via latitude and longitude.
  const factory GeocodedLocation.latLng(double latitude, double longitude) =
      LocationPosition;
}

class AddressPosition implements GeocodedLocation {
  final String address;

  const AddressPosition(this.address);

  @override
  String toUrlString() => address;
}

class LocationPosition extends Location implements GeocodedLocation {
  const LocationPosition(double latitude, double longitude)
      : super(latitude, longitude);
}

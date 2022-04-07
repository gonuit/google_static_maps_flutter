import 'package:google_static_maps_controller/google_static_maps_controller.dart';

/// The Maps Static API uses numbers (latitude and longitude values) or string
/// (address) to specify a location.
/// These values identify a geocoded location.
abstract class GeocodedLocation extends EncodableUrlPart {
  /// Most people don't speak in latitudes and longitudes;
  /// they denote locations using addresses. The process of turning an address
  /// into a geographic point is known as geocoding and the Maps Static API
  /// service can perform geocoding for you if you provide valid addresses.
  const factory GeocodedLocation.address(String address) = AddressLocation;

  /// Specify location via latitude and longitude.
  const factory GeocodedLocation.latLng(double latitude, double longitude) =
      Location;
}

/// Geocoded location specified by the [address] string.
class AddressLocation implements GeocodedLocation {
  final String address;

  const AddressLocation(this.address);

  @override
  String toUrlString() => address;
}

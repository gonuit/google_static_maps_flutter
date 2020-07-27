part of google_static_maps_controller;

abstract class Marker implements MapPart {
  final List<Location> locations;

  const Marker._(this.locations)
      : assert(
          locations != null,
          "locations cannot be null",
        )
  // ,assert(
  //   locations != null && locations.length > 0,
  //   "At least one location should be provided",
  // )
  ;

  /// Create default google maps style marker
  const factory Marker({
    List<Location> locations,
    Color color,
    MarkerSize size,
    String label,
  }) = DefaultMarker;

  /// Create marker with custom icon
  const factory Marker.custom({
    List<Location> locations,
    String icon,
    MarkerAnchor anchor,
  }) = CustomMarker;

  String get _markerLocationsString {
    List<String> parts = List<String>(locations.length);
    for (int i = 0; i < locations.length; i++) {
      parts[i] = locations[i].toUrlString();
    }
    return parts.join(_separator);
  }
}

part of google_static_maps_controller;

class CustomMarker extends Marker {
  /// Icon URL address
  final String icon;
  final MarkerAnchor? anchor;

  const CustomMarker({
    required List<Location> locations,
    required this.icon,
    this.anchor,
  }) : super._(locations);

  @override
  String toUrlString() {
    if (locations.isEmpty) {
      throw StateError(
        'Marker must contain at least one location. '
        'Empty array was provided to "locations" argument.',
      );
    }

    String string = "";

    if (anchor != null) string += "anchor:${anchor!.value}$_separator";

    string += "icon:$icon$_separator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}

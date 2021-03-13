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

  String? toUrlString() {
    String string = "";
    if (locations.isEmpty) return null;

    if (anchor != null) string += "anchor:${anchor!.value}$_separator";

    string += "icon:$icon$_separator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}

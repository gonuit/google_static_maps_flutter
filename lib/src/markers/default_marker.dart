part of google_static_maps_controller;

class DefaultMarker extends Marker {
  final Color color;
  final MarkerSize size;
  final String label;

  const DefaultMarker({
    @required List<Location> locations,
    this.color,
    this.size,
    this.label,
  })  : assert(
          label == null || (label != null && label.length == 1),
          "Label can have only one letter",
        ),
        super._(locations);

  String toUrlString() {
    String string = "";
    if (locations.isEmpty) return null;

    final markerSize = size.value;
    if (markerSize != null) string += "size:$markerSize$_separator";

    if (label != null)
      string += "label:${label[0].toUpperCase()}$_separator";

    if (color != null)
      string += "color:${toHex24BitColorString(color)}$_separator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}

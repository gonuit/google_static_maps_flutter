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

  String get _hex24BitColorString {
    final hexColorString32Bit = color.value.toRadixString(16);
    final hexColorString24Bit =
        hexColorString32Bit.substring(2, hexColorString32Bit.length);
    return hexColorString24Bit;
  }

  String toUrlEncodedString() {
    String string = "";
    if (locations.isEmpty) return null;

    final markerSize = size.value;
    if (markerSize != null) string += "size:$markerSize$_markerSeparator";

    if (label != null)
      string += "label:${label[0].toUpperCase()}$_markerSeparator";

    if (color != null)
      string += "color:0x$_hex24BitColorString$_markerSeparator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}

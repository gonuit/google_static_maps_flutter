part of google_static_maps_controller;

class Marker {
  static const separator = "|";

  final Color color;
  final MarkerSize size;
  final String label;
  final List<Location> locations;

  const Marker({
    @required this.locations,
    this.color,
    this.size,
    this.label,
  }) : assert(
          label == null || (label != null && label.length == 1),
          "Label can have only one letter",
        )
  // ,assert(
  //   locations != null && locations.length > 0,
  //   "At least one location should be provided",
  // )
  ;

  String get _hex24BitColorString {
    final hexColorString32Bit = color.value.toRadixString(16);
    final hexColorString24Bit =
        hexColorString32Bit.substring(2, hexColorString32Bit.length);
    return hexColorString24Bit;
  }

  String get _markerLocationsString {
    String string = "";
    for (int i = 0; i < locations.length; i++) {
      final location = locations[i];

      string += "${location.latitude}, ${location.longitude}";

      if (i + 1 < locations.length) {
        string += separator;
      }
    }
    return string;
  }

  String toUrlEncodedString() {
    String string = "";
    if (locations.isEmpty) return null;

    final markerSize = size.value;
    if (markerSize != null) string += "size:$markerSize$separator";

    if (label != null) string += "label:${label[0].toUpperCase()}$separator";

    if (color != null) string += "color:0x$_hex24BitColorString$separator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}

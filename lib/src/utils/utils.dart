part of google_static_maps_controller;

const _separator = "|";

MapScale getScaleForDevicePixelRatio(double devicePixelRatio) {
  assert(devicePixelRatio != null, "device pixel ratio cannot be null");

  if (devicePixelRatio <= 1) {
    return MapScale.scale1;
  } else if (devicePixelRatio <= 2) {
    return MapScale.scale2;
  } else {
    return MapScale.scale4;
  }
}

String toHex24BitColorString(Color color) {
  final hexColorString32Bit = color.value.toRadixString(16);
  final hexColorString24Bit =
      hexColorString32Bit.substring(2, hexColorString32Bit.length);
  return "0x$hexColorString24Bit";
}

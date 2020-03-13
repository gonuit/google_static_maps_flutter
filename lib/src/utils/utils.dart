part of google_static_maps_controller;

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

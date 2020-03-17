part of google_static_maps_controller;

class MarkerAnchor {
  final String value;
  const MarkerAnchor._predefined(this.value);

  const MarkerAnchor(int x, int y)
      : assert(
          x != null && y != null,
          "x and y cannot be null",
        ),
        value = "$x, $y";

  static const top = MarkerAnchor._predefined("top");
  static const bottom = MarkerAnchor._predefined("bottom");
  static const left = MarkerAnchor._predefined("left");
  static const right = MarkerAnchor._predefined("right");
  static const center = MarkerAnchor._predefined("center");
  static const topLeft = MarkerAnchor._predefined("topleft");
  static const topRight = MarkerAnchor._predefined("topright");
  static const bottomLeft = MarkerAnchor._predefined("bottomleft");
  static const bottomRight = MarkerAnchor._predefined("bottomright");
}

part of google_static_maps_controller;

/// The path class defines a set of one or more locations
/// connected by a path to overlay on the map image.
class Path implements MapPart {
  /// (optional) specifies the thickness of the path in pixels.
  /// If no weight parameter is set, the path will appear in its
  /// default thickness (5 pixels).
  final int weight;

  /// (optional) Specifies a path color;
  final Color color;

  /// (optional) indicates both that the path marks off a polygonal
  /// area and specifies the fill color to use as an overlay within
  /// that area. The set of locations following need not be a "closed"
  /// loop; the Maps Static API server will automatically join the
  /// first and last points. Note, however, that any stroke on the
  /// exterior of the filled area will not be closed unless you
  /// specifically provide the same beginning and end location.
  final Color fillColor;

  /// (optional) indicates that the requested path should be
  /// interpreted as a geodesic line that follows the curvature of
  /// the earth. When false, the path is rendered as a straight
  /// line in screen space. Defaults to false.
  final bool geodesic;

  /// In order to draw a path, the path class must also be passed
  /// two or more points. The Maps Static API will then connect the
  /// path along those points, in the specified order.
  final List<Location> points;

  const Path({
    @required this.points,
    this.weight,
    this.color,
    this.fillColor,
    this.geodesic,
  }) : assert(
          points != null,
          'locations cannot be null',
        );

  @override
  String toUrlString() {
    if (points.isEmpty) return null;

    List<String> parts = <String>[];

    if (weight != null) parts.add("weight:$weight");
    if (color != null) parts.add("color:${color.to32BitHexString()}");
    if (geodesic != null) parts.add("geodesic:$geodesic");
    if (fillColor != null)
      parts.add("fillcolor:${fillColor.to32BitHexString()}");

    for (final location in points) {
      parts.add(location.toUrlString());
    }

    return parts.join(_separator);
  }
}

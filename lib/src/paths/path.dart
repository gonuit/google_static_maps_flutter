part of google_static_maps_controller;

/// The path class defines a set of one or more locations
/// connected by a path to overlay on the map image.
class Path implements EncodableUrlPart {
  /// (optional) specifies the thickness of the path in pixels.
  /// If no weight parameter is set, the path will appear in its
  /// default thickness (5 pixels).
  final int? weight;

  /// (optional) Specifies a path color;
  final Color? color;

  /// (optional) indicates both that the path marks off a polygonal
  /// area and specifies the fill color to use as an overlay within
  /// that area. The set of locations following need not be a "closed"
  /// loop; the Maps Static API server will automatically join the
  /// first and last points. Note, however, that any stroke on the
  /// exterior of the filled area will not be closed unless you
  /// specifically provide the same beginning and end location.
  final Color? fillColor;

  /// (optional) indicates that the requested path should be
  /// interpreted as a geodesic line that follows the curvature of
  /// the earth. When false, the path is rendered as a straight
  /// line in screen space. Defaults to false.
  final bool? geodesic;

  /// (optional) Circle radius in meters.
  ///
  /// In order to render a circle, make sure to provide only one
  /// path point.
  ///
  /// This is not a part of the official google static maps API,
  /// but a useful addition that simplifies drawing circles.
  final int? radius;

  /// In order to draw a path, the path class must also be passed
  /// two or more points. The Maps Static API will then connect the
  /// path along those points, in the specified order.
  ///
  /// This library also accepts a single point and [radius] parameter
  /// to draw circles.
  final List<Location> points;

  const Path({
    required this.points,
    this.weight,
    this.radius,
    this.color,
    this.fillColor,
    this.geodesic,
  });

  @override
  String toUrlString() {
    if (radius != null && points.length < 1) {
      throw StateError(
        'In order to draw a circle, a point is needed',
      );
    } else if (radius == null && points.length == 1) {
      throw StateError(
        'In order to draw a circle, the radius must be provided',
      );
    } else if (radius == null && points.length < 2) {
      throw StateError(
        'In order to draw a path, the path '
        'class must also be passed two or more points. points.length=${points.length}',
      );
    }

    List<String> parts = <String>[];

    if (weight != null) parts.add("weight:$weight");
    if (color != null) parts.add("color:${color!.to32BitHexString()}");
    if (geodesic != null) parts.add("geodesic:$geodesic");
    if (fillColor != null)
      parts.add("fillcolor:${fillColor!.to32BitHexString()}");
    if (radius != null) {
      parts.add(
        "${_drawCirclePath(this.points.first.latitude, this.points.first.longitude, radius!)}",
      );
    } else {
      for (final location in points) {
        parts.add(location.toUrlString());
      }
    }
    return parts.join(_separator);
  }

  String _drawCirclePath(
    double latitude,
    double longitude,
    int radius, {
    int detail = 8,
  }) {
    int R = 6371;

    double lat = (latitude * pi) / 180;
    double lng = (longitude * pi) / 180;
    double d = (radius / 1000) / R;

    int i = 0;

    final value = StringBuffer();

    for (i = 0; i <= 360; i += detail) {
      double brng = (i * pi) / 180;

      double plat = asin(sin(lat) * cos(d) + cos(lat) * sin(d) * cos(brng));
      double plng = ((lng +
                  atan2(sin(brng) * sin(d) * cos(lat),
                      cos(d) - sin(lat) * sin(plat))) *
              180) /
          pi;
      plat = (plat * 180) / pi;

      if (value.isNotEmpty) {
        value.write(_separator);
      }
      value.write("$plat,$plng");
    }

    return value.toString();
  }
}

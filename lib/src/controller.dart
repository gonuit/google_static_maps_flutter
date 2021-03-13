part of google_static_maps_controller;

/// controls static map
class StaticMapController {
  /// A Map ID is a unique identifier that represents a single instance of
  /// a Google Map. You can create Map IDs and update a style associated with
  /// a Map ID at any time in the Google Cloud Console without changing
  /// embedded JSON styling in your application code.
  final String? mapId;

  final List<Marker>? markers;

  final List<MapStyle>? styles;

  final List<Path>? paths;

  /// Defines the center of the map, equidistant from all edges of the map.
  final Location? center;

  /// defines the zoom level of the map, which determines the magnification
  /// level of the map. This parameter takes a numerical value corresponding
  /// to the zoom level of the region desired.
  final int? zoom;

  /// This parameter is affected by the scale parameter, the final output
  /// width is the product of the width and scale values
  final int width;

  /// This parameter is affected by the scale parameter, the final output
  /// height is the product of the height and scale values
  final int height;

  /// Affects the number of pixels that are returned. scale=2 returns twice as
  /// many pixels as scale=1 while retaining the same coverage area and level
  /// of detail (i.e. the contents of the map don't change). This is useful
  /// when developing for high-resolution displays, or when generating a map
  /// for printing. The default value is 1. Accepted values are 2 and 4.
  final MapScale? scale;

  /// defines the format of the resulting image. By default, the Maps Static
  /// API creates PNG images. There are several possible formats including
  /// GIF, JPEG and PNG types. Which format you use depends on how you intend
  /// to present the image. JPEG typically provides greater compression, while
  /// GIF and PNG provide greater detail.
  final MapImageFormat? format;

  /// Defines the type of map to construct. There are several possible maptype
  /// values, including roadmap, satellite, hybrid, and terrain.
  final StaticMapType? maptype;

  /// Defines the language to use for display of labels on map tiles.
  /// Note that this parameter is only supported for some country tiles;
  /// if the specific language requested is not supported for the tile set,
  /// then the default language for that tileset will be used.
  final String? language;

  /// Defines the appropriate borders to display, based on geo-political
  /// sensitivities. Accepts a region code specified as a two-character
  /// ccTLD ('top-level domain') value
  final String? region;

  /// allows you to monitor your application's API usage in the Google Cloud
  /// Platform Console, and ensures that Google can contact you about your
  /// application if necessary
  final String googleApiKey;

  /// is a digital signature used to verify that any site generating requests
  /// using your API key is authorized to do so. Requests without a digital
  /// signature might fail
  final String? signature;

  Map<String, dynamic> get _getQueryParameters {
    final params = <String, dynamic>{};

    params["key"] = googleApiKey;
    params["size"] = "${width}x$height";

    /// TODO: center could be string
    if (center != null)
      params["center"] = "${center!.latitude}, ${center!.longitude}";
    if (language != null) params["language"] = language;
    if (maptype != null) params["maptype"] = maptype!.value;
    if (zoom != null) params["zoom"] = zoom!.toString();
    if (format != null) params["format"] = format!.value;
    if (scale != null) params["scale"] = scale!.value;
    if (region != null) params["region"] = region;

    String urlEncodeMapPart(MapPart part) => part.toUrlString();
    if (markers != null) {
      params["markers"] = markers!.map(urlEncodeMapPart);
    }
    if (paths != null) {
      params["path"] = paths!.map(urlEncodeMapPart);
    }

    if (mapId != null && styles != null) {
      throw StateError(
          "styles argument cannot be provided when mapId is present.");
    }

    if (mapId != null) {
      params["map_id"] = mapId;
    } else if (styles != null) {
      params["style"] = styles!.map(urlEncodeMapPart);
    }

    return params;
  }

  Uri get url => Uri(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "/maps/api/staticmap",
        queryParameters: _getQueryParameters,
      );

  /// Returns [ImageProvider] with current map.
  ImageProvider get image => NetworkImage(url.toString());

  const StaticMapController({
    required this.googleApiKey,
    required this.width,
    required this.height,
    this.mapId,
    this.markers,
    this.styles,
    this.paths,
    this.center,
    this.zoom,
    this.scale,
    this.format,
    this.maptype,
    this.language,
    this.region,
    this.signature,
  })  : assert(
          (center != null && zoom != null) || markers != null,
          "center and zoom should be provided when markers are not",
        ),
        assert(
          !(styles != null && mapId != null),
          "mapId cannot be provided together with styles argument.",
        );

  StaticMapController copyWith({
    String? googleApiKey,
    int? width,
    int? height,
    List<Marker>? markers,
    List<Path>? paths,
    Location? center,
    int? zoom,
    MapScale? scale,
    MapImageFormat? format,
    StaticMapType? maptype,
    String? language,
    String? region,
    String? signature,
  }) =>
      StaticMapController(
        googleApiKey: googleApiKey ?? this.googleApiKey,
        width: width ?? this.width,
        height: height ?? this.height,
        markers: markers ?? this.markers,
        paths: paths ?? this.paths,
        center: center ?? this.center,
        zoom: zoom ?? this.zoom,
        scale: scale ?? this.scale,
        format: format ?? this.format,
        maptype: maptype ?? this.maptype,
        language: language ?? this.language,
        region: region ?? this.region,
        signature: signature ?? this.signature,
      );

  @override
  String toString() => "$runtimeType($url)";
}

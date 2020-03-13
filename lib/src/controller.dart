part of google_static_maps_controller;

/// controls static map
class StaticMapController {
  final List<Marker> _markers;
  List<Marker> get markers => _markers;

  /// Defines the center of the map, equidistant from all edges of the map.
  final Location _center;
  Location get center => _center;

  /// defines the zoom level of the map, which determines the magnification
  /// level of the map. This parameter takes a numerical value corresponding
  /// to the zoom level of the region desired.
  final int _zoom;
  int get zoom => _zoom;

  /// This parameter is affected by the scale parameter, the final output
  /// width is the product of the width and scale values
  final int _width;
  int get width => _width;

  /// This parameter is affected by the scale parameter, the final output
  /// height is the product of the height and scale values
  final int _height;
  int get height => _height;

  /// Affects the number of pixels that are returned. scale=2 returns twice as
  /// many pixels as scale=1 while retaining the same coverage area and level
  /// of detail (i.e. the contents of the map don't change). This is useful
  /// when developing for high-resolution displays, or when generating a map
  /// for printing. The default value is 1. Accepted values are 2 and 4.
  final MapScale _scale;
  MapScale get scale => _scale;

  /// defines the format of the resulting image. By default, the Maps Static
  /// API creates PNG images. There are several possible formats including
  /// GIF, JPEG and PNG types. Which format you use depends on how you intend
  /// to present the image. JPEG typically provides greater compression, while
  /// GIF and PNG provide greater detail.
  final MapImageFormat _format;
  MapImageFormat get format => _format;

  /// Defines the type of map to construct. There are several possible maptype
  /// values, including roadmap, satellite, hybrid, and terrain.
  final StaticMapType _maptype;
  StaticMapType get maptype => _maptype;

  /// Defines the language to use for display of labels on map tiles.
  /// Note that this parameter is only supported for some country tiles;
  /// if the specific language requested is not supported for the tile set,
  /// then the default language for that tileset will be used.
  final String _language;
  String get language => _language;

  /// Defines the appropriate borders to display, based on geo-political
  /// sensitivities. Accepts a region code specified as a two-character
  /// ccTLD ('top-level domain') value
  final String _region;
  String get region => _region;

  /// allows you to monitor your application's API usage in the Google Cloud
  /// Platform Console, and ensures that Google can contact you about your
  /// application if necessary
  final String _googleApiKey;
  String get googleApiKey => _googleApiKey;

  /// is a digital signature used to verify that any site generating requests
  /// using your API key is authorized to do so. Requests without a digital
  /// signature might fail
  final String _signature;
  String get signature => _signature;

  Map<String, dynamic> get _getQueryParameters {
    final params = <String, dynamic>{};

    params["key"] = googleApiKey;
    params["size"] = "${width}x$height";
    if (language != null) params["language"] = language;
    if (maptype.value != null) params["maptype"] = maptype.value;
    if (zoom != null) params["zoom"] = zoom.toString();
    if (format != null) params["format"] = format.value;
    if (scale != null) params["scale"] = scale.value;
    if (region != null) params["region"] = region;
    if (markers != null)
      params["markers"] = <String>[
        for (final marker in markers) marker.toUrlEncodedString()
      ];

    return params;
  }

  Uri get url => Uri(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "/maps/api/staticmap",
        queryParameters: _getQueryParameters,
      );

  const StaticMapController({
    @required String googleApiKey,
    @required int width,
    @required int height,
    List<Marker> markers,
    Location center,
    int zoom,
    MapScale scale,
    MapImageFormat format,
    StaticMapType maptype,
    String language,
    String region,
    String signature,
  })  : assert(
          width != null && height != null,
          "Map width and height should be provided",
        ),
        assert(
          center != null && zoom != null || markers != null,
          "center and zoom should be provided when markers are not",
        ),
        assert(
          googleApiKey != null,
          "Google api key should be provided and cannot be null",
        ),
        _language = language,
        _region = region,
        _signature = signature,
        _maptype = maptype,
        _format = format,
        _scale = scale,
        _zoom = zoom,
        _center = center,
        _markers = markers,
        _googleApiKey = googleApiKey,
        _height = height,
        _width = width;

  StaticMapController copyWith({
    String googleApiKey,
    int width,
    int height,
    List<Marker> markers,
    Location center,
    int zoom,
    MapScale scale,
    MapImageFormat format,
    StaticMapType maptype,
    String language,
    String region,
    String signature,
    double devicePixelRatio,
  }) =>
      StaticMapController(
        googleApiKey: googleApiKey ?? this.googleApiKey,
        width: width ?? this.width,
        height: height ?? this.height,
        markers: markers ?? this.markers,
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
  String toString() => "$runtimeType: $url";
}

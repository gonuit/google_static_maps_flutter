part of google_static_maps_controller;

/// Widget for displaying static map. It uses `Image.network` widget. 
class StaticMap extends StatelessWidget {
  final List<Marker>? markers;
  final List<MapStyle>? styles;
  final List<Path>? paths;

  /// Defines the center of the map, equidistant from all edges of the map.
  final Location? center;

  /// Defines the zoom level of the map, which determines the magnification
  /// level of the map. This parameter takes a numerical value corresponding
  /// to the zoom level of the region desired.
  final int? zoom;

  /// This parameter is affected by the scale parameter, the final output
  /// width is the product of the width and scale values
  final double? width;

  /// This parameter is affected by the scale parameter, the final output
  /// height is the product of the height and scale values
  final double? height;

  /// Affects the number of pixels that are returned. scale=2 returns twice as
  /// many pixels as scale=1 while retaining the same coverage area and level
  /// of detail (i.e. the contents of the map don't change). This is useful
  /// when developing for high-resolution displays, or when generating a map
  /// for printing. The default value is 1. Accepted values are 2 and 4.
  final MapScale? scale;

  /// Defines the format of the resulting image. By default, the Maps Static
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

  /// Allows you to monitor your application's API usage in the Google Cloud
  /// Platform Console, and ensures that Google can contact you about your
  /// application if necessary
  final String googleApiKey;

  /// Signature is used to verify that any site generating requests
  /// using your API key is authorized to do so. Requests without a digital
  /// signature might fail
  final String? signature;

  /// If it is set to true, [scale] will be changed automaticly according to device
  /// pixel ratio
  final bool scaleToDevicePixelRatio;

  const StaticMap({
    Key? key,
    required this.googleApiKey,
    this.width,
    this.height,
    this.markers,
    this.center,
    this.zoom,
    this.scale,
    this.format,
    this.maptype,
    this.paths,
    this.language,
    this.region,
    this.signature,
    this.styles,
    this.scaleToDevicePixelRatio = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final scale = scaleToDevicePixelRatio
        ? getScaleForDevicePixelRatio(devicePixelRatio)
        : this.scale;

    return SizedBox(
      height: height,
      width: width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final pixelRatio = MediaQuery.of(context).devicePixelRatio;
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final mapController = StaticMapController(
            scale: scale,
            width: (width * pixelRatio).ceil(),
            height: (height * pixelRatio).ceil(),
            googleApiKey: googleApiKey,
            center: center,
            format: format,
            language: language,
            maptype: maptype,
            markers: markers,
            paths: paths,
            region: region,
            signature: signature,
            zoom: zoom,
            styles: styles,
          );

          return Image.network(
            mapController.url.toString(),
            width: width,
            height: height,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}

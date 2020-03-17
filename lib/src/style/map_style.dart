part of google_static_maps_controller;

class StyleRule {
  final String _key;
  final String _value;

  /// Indicates the basic color.
  StyleRule.hue(Color hue)
      : assert(
          hue != null,
          "hue argument cannot be null",
        ),
        _key = "hue",
        _value = toHex24BitColorString(hue);

  /// (a floating point value between -100 and 100) indicates the percentage
  /// change in brightness of the element. Negative values increase darkness
  /// (where -100 specifies black) while positive values increase brightness
  /// (where +100 specifies white).
  ///
  /// Note: This option sets the lightness while keeping the saturation and
  /// hue specified in the default Google style (or in other style options you
  /// define on the map). The resulting color is relative to the style of the
  /// base map. If Google makes any changes to the base map style, the changes
  /// affect your map's features styled with lightness. It's better to use the
  /// absolute color styler if you can.
  StyleRule.lightness(int lightness)
      : assert(
          lightness >= -100 && lightness <= 100,
          "lightness argument must be in range -100 to 100",
        ),
        _key = "lightness",
        _value = lightness?.toString();

  /// (a floating point value between -100 and 100) indicates the percentage
  /// change in intensity of the basic color to apply to the element.
  ///
  /// Note: This option sets the saturation while keeping the hue and lightness
  /// specified in the default Google style (or in other style options you define
  /// on the map). The resulting color is relative to the style of the base map.
  /// If Google makes any changes to the base map style, the changes affect your
  /// map's features styled with saturation. It's better to use the absolute color
  /// styler if you can.
  StyleRule.saturation(int saturation)
      : assert(
          saturation >= -100 && saturation <= 100,
          "saturation argument must be in range -100 to 100",
        ),
        _key = "saturation",
        _value = saturation?.toString();

  /// (a floating point value between 0.01 and 10.0, where 1.0 applies no correction)
  /// indicates the amount of gamma correction to apply to the element. Gamma corrections
  /// modify the lightness of colors in a non-linear fashion, while not affecting white or
  /// black values. Gamma correction is typically used to modify the contrast of multiple
  /// elements. For example, you can modify the gamma to increase or decrease the contrast
  /// between the edges and interiors of elements.
  ///
  /// Note: This option adjusts the lightness relative to the default Google style, using
  /// a gamma curve. If Google makes any changes to the base map style, the changes affect
  /// your map's features styled with gamma. It's better to use the absolute color styler
  /// if you can.
  StyleRule.gamma(double gamma)
      : assert(
          gamma >= 0.01 && gamma <= 10.0,
          "gamma argument must be in range 0.01 to 10.0",
        ),
        _key = "gamma",
        _value = gamma?.toString();

  /// (if true) inverts the existing lightness. This is useful, for example, for quickly
  /// switching to a darker map with white text.
  ///
  /// Note: This option simply inverts the default Google style. If Google makes any
  /// changes to the base map style, the changes affect your map's features styled with
  /// invert_lightness. It's better to use the absolute color styler if you can.
  StyleRule.invertLightness(bool invertLightness)
      : assert(
          invertLightness != null,
          "invertLightness argument cannot be null",
        ),
        _key = "invert_lightness",
        _value = invertLightness?.toString();

  /// indicates whether and how the element appears on the map. A simplified visibility
  /// removes some style features from the affected features; roads, for example, are
  /// simplified into thinner lines without outlines, while parks lose their label text
  /// but retain the label icon.
  StyleRule.visibility(VisibilityRule visibility)
      : assert(
          visibility != null,
          "visibility argument cannot be null",
        ),
        _key = "visibility",
        _value = visibility?.value;

  /// sets the color of the feature.
  StyleRule.color(Color color)
      : assert(
          color != null,
          "color argument cannot be null",
        ),
        _key = "color",
        _value = toHex24BitColorString(color);

  /// (an integer value, greater than or equal to zero) sets the weight of the feature,
  /// in pixels. Setting the weight to a high value may result in clipping near tile borders.
  StyleRule.weight(int weight)
      : assert(
          weight != null && weight >= 0,
          "weight argument should be greater than or equal to zero",
        ),
        _key = "weight",
        _value = weight?.toString();

  String toUrlString() => "$_key:$_value";

  @override
  String toString() => "$runtimeType($_key, $_value)";
}

/// Customize the presentation of the standard Google map by applying your own
/// styles when using the Maps Static API. You can change the visual display of
/// features such as roads, parks, built-up areas, and other points of interest.
/// Change their color or style to emphasize particular content, complement
/// surrounding content on the page, or even hide features completely.
class MapStyle {
  final StyleFeature feature;
  final StyleElement element;

  /// Style rules are applied in the order that you specify. Do not
  /// combine multiple operations into a single style operation.
  /// Instead, define each operation as a separate entry in the
  /// style array.
  ///
  /// Note: Order is important, as some operations are not commutative.
  /// Features and/or elements that are modified through style operations
  /// (usually) already have existing styles. The operations act on those
  /// existing styles, if present.
  final List<StyleRule> rules;

  const MapStyle({
    this.element,
    this.feature,
    @required this.rules,
  }) : assert(
          rules != null && rules.length > 0,
          "rules must contain at least one StyleRule",
        );

  String _rulesUrlString() {
    String url = "";

    for (int i = 0; i < rules.length; i++) {
      final rule = rules[i];

      url += rule.toUrlString();

      if (i + 1 < rules.length) {
        url += _separator;
      }
    }

    return url;
  }

  String toUrlString() {
    String url = "";
    if (feature != null) url += "feature:${feature.value}$_separator";
    if (element != null) url += "element:${element.value}$_separator";
    url += _rulesUrlString();
    return url;
  }
}

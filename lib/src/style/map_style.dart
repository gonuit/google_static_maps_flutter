part of google_static_maps_controller;

abstract class StyleRule implements EncodableUrlPart {
  String get key;
  String get value;

  const StyleRule();

  /// Indicates the basic color.
  const factory StyleRule.hue(Color hue) = _StyleHueRule;

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
  const factory StyleRule.lightness(int lightness) = _StyleLightnessRule;

  /// (a floating point value between -100 and 100) indicates the percentage
  /// change in intensity of the basic color to apply to the element.
  ///
  /// Note: This option sets the saturation while keeping the hue and lightness
  /// specified in the default Google style (or in other style options you define
  /// on the map). The resulting color is relative to the style of the base map.
  /// If Google makes any changes to the base map style, the changes affect your
  /// map's features styled with saturation. It's better to use the absolute color
  /// styler if you can.
  const factory StyleRule.saturation(int saturation) = _StyleSaturationRule;

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
  const factory StyleRule.gamma(double gamma) = _StyleGammaRule;

  /// (if true) inverts the existing lightness. This is useful, for example, for quickly
  /// switching to a darker map with white text.
  ///
  /// Note: This option simply inverts the default Google style. If Google makes any
  /// changes to the base map style, the changes affect your map's features styled with
  /// invert_lightness. It's better to use the absolute color styler if you can.
  const factory StyleRule.invertLightness(bool invertLightness) =
      _StyleInvertLightnessRule;

  /// indicates whether and how the element appears on the map. A simplified visibility
  /// removes some style features from the affected features; roads, for example, are
  /// simplified into thinner lines without outlines, while parks lose their label text
  /// but retain the label icon.
  const factory StyleRule.visibility(VisibilityRule visibility) =
      _StyleVisibilityRule;

  /// sets the color of the feature.
  const factory StyleRule.color(Color color) = _StyleColorRule;

  /// (an integer value, greater than or equal to zero) sets the weight of the feature,
  /// in pixels. Setting the weight to a high value may result in clipping near tile borders.
  const factory StyleRule.weight(int weight) = _StyleWeightRule;

  @override
  String toUrlString() => "$key:$value";

  @override
  String toString() => "$runtimeType($key, $value)";
}

class _StyleHueRule extends StyleRule {
  final Color hue;

  @override
  String get key => "hue";
  @override
  String get value => hue.to24BitHexString();
  const _StyleHueRule(this.hue);
}

class _StyleColorRule extends StyleRule {
  final Color color;

  @override
  String get key => "color";
  @override
  String get value => color.to24BitHexString();
  const _StyleColorRule(this.color);
}

class _StyleLightnessRule extends StyleRule {
  final int lightness;

  @override
  String get key => "lightness";
  @override
  String get value => lightness.toString();

  const _StyleLightnessRule(this.lightness)
      : assert(
          lightness >= -100 && lightness <= 100,
          "lightness argument must be in range -100 to 100",
        );
}

class _StyleSaturationRule extends StyleRule {
  final int saturation;

  @override
  String get key => "saturation";
  @override
  String get value => saturation.toString();

  const _StyleSaturationRule(this.saturation)
      : assert(
          saturation >= -100 && saturation <= 100,
          "saturation argument must be in range -100 to 100",
        );
}

class _StyleWeightRule extends StyleRule {
  final int weight;

  @override
  String get key => "weight";
  @override
  String get value => weight.toString();

  const _StyleWeightRule(this.weight)
      : assert(
          weight >= 0,
          "weight argument should be greater than or equal to zero",
        );
}

class _StyleGammaRule extends StyleRule {
  final double gamma;

  @override
  String get key => "gamma";
  @override
  String get value => gamma.toString();

  const _StyleGammaRule(this.gamma)
      : assert(
          gamma >= 0.01 && gamma <= 10.0,
          "gamma argument must be in range 0.01 to 10.0",
        );
}

class _StyleInvertLightnessRule extends StyleRule {
  final bool invertLightness;

  @override
  String get key => "invert_lightness";
  @override
  String get value => invertLightness.toString();

  const _StyleInvertLightnessRule(this.invertLightness);
}

class _StyleVisibilityRule extends StyleRule {
  final VisibilityRule visibility;

  @override
  String get key => "visibility";
  @override
  String get value => visibility.value;

  const _StyleVisibilityRule(this.visibility);
}

class MapStyle implements EncodableUrlPart {
  final StyleFeature? feature;
  final StyleElement? element;

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

  /// Customize the presentation of the standard Google map by applying your own
  /// styles when using the Maps Static API. You can change the visual display of
  /// features such as roads, parks, built-up areas, and other points of interest.
  /// Change their color or style to emphasize particular content, complement
  /// surrounding content on the page, or even hide features completely.
  const MapStyle({
    this.element,
    this.feature,
    required this.rules,
  });

  String _rulesUrlString() {
    final parts = List<String>.generate(
        rules.length, (int index) => rules[index].toUrlString());

    return parts.join(_separator);
  }

  @override
  String toUrlString() {
    String url = "";
    if (feature != null) url += "feature:${feature!.value}$_separator";
    if (element != null) url += "element:${element!.value}$_separator";
    url += _rulesUrlString();
    return url;
  }
}

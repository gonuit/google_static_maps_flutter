part of google_static_maps_controller;

class _StyleElementGeometry extends StyleElement {
  const _StyleElementGeometry() : super._("geometry");

  /// selects only the fill of the feature's geometry.
  final fill = const StyleElement._("geometry.fill");

  /// selects only the stroke of the feature's geometry.
  final stroke = const StyleElement._("geometry.stroke");
}

class _StyleElementLabelsText extends StyleElement {
  const _StyleElementLabelsText() : super._("labels.text");

  /// selects only the fill of the label. The fill of a label is typically rendered as a colored outline that surrounds the label text.
  final fill = const StyleElement._("labels.text.fill");

  /// selects only the stroke of the label's text
  final stroke = const StyleElement._("labels.text.stroke");
}

class _StyleElementLabels extends StyleElement {
  const _StyleElementLabels() : super._("labels");

  /// selects only the icon displayed within the feature's label
  final icon = const StyleElement._("labels.icon");

  /// selects only the text of the label
  final text = const _StyleElementLabelsText();
}

class StyleElement {
  final String value;
  const StyleElement._(this.value);

  /// selects all elements of the specified feature.
  static const all = StyleElement._("all");

  /// selects all geometric elements of the specified feature.
  static const geometry = _StyleElementGeometry();

  /// selects the textual labels associated with the specified feature
  static const labels = _StyleElementLabels();
}

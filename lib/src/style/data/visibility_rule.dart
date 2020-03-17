part of google_static_maps_controller;

enum VisibilityRule {
  on,
  off,
  simplified,
}

extension VisibilityRuleExtension on VisibilityRule {
  String get value {
    switch (this) {
      case VisibilityRule.on:
        return "on";
      case VisibilityRule.off:
        return "off";
      case VisibilityRule.simplified:
        return "simplified";
      default:
        return null;
    }
  }
}

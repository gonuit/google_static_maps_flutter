import 'dart:ui';

enum StyleFeature {
  /// selects all features
  all,

  /// selects all administrative areas. Styling affects only the labels of administrative areas, not the geographical borders or fill
  administrative,

  /// selects countries
  administrativeCountry,

  /// selects land parcels
  administrativeLandParcel,

  /// selects localities
  administrativeLocality,

  /// selects neighborhoods
  administrativeNeighborhood,

  /// selects provinces
  administrativeProvince,

  /// selects all landscapes
  landscape,

  /// selects man-made features, such as buildings and other structures.
  landscapeManMade,

  /// selects natural features, such as mountains, rivers, deserts, and glaciers
  landscapeNatural,

  /// selects land cover features, the physical material that covers the earth's surface, such as forests, grasslands, wetlands, and bare ground.
  landscapeNaturalLandcover,

  /// selects terrain features of a land surface, such as elevation, slope, and orientation.
  landscapeNaturalTerrain,

  /// selects all points of interest
  poi,

  /// selects tourist attractions.
  poiAttraction,

  /// selects businesses
  poiBusiness,

  /// selects government buildings
  poiGovernment,

  ///  selects emergency services, including hospitals, pharmacies, police, doctors, and others.
  poiMedical,

  /// selects parks.
  poiPark,

  /// selects places of worship, including churches, temples, mosques, and others
  poiPlaceOfWorship,

  /// selects schools
  poiSchool,

  /// selects sports complexes
  poiSportsComplex,

  /// selects all roads
  road,

  /// selects arterial roads
  roadArterial,

  /// selects highways
  roadHighway,

  /// selects highways with controlled access
  roadHighwayControlledAccess,

  /// selects local roads
  roadLocal,

  /// selects all transit stations and lines
  transit,

  /// selects transit lines
  transitLine,

  /// selects all transit stations.
  transitStation,

  /// selects airports
  transitStationAirport,

  /// selects bus stops
  transitStationBus,

  /// selects rail stations.
  transitStationRail,

  /// selects bodies of water.
  water,
}

enum StyleElement {
  /// selects all elements of the specified feature.
  all,

  /// selects all geometric elements of the specified feature.
  geometry,

  /// selects only the fill of the feature's geometry.
  geometryFill,

  /// selects only the stroke of the feature's geometry.
  geometryStroke,

  /// selects the textual labels associated with the specified feature
  labels,

  /// selects only the icon displayed within the feature's label
  labelsIcon,

  /// selects only the text of the label
  labelsText,

  /// selects only the fill of the label. The fill of a label is typically rendered as a colored outline that surrounds the label text.
  labelsTextFill,

  /// selects only the stroke of the label's text
  labelsTextStroke,
}

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

class StyleRules {
  final Color hue;
  final int lightness;
  final int saturation;
  final double gamma;
  final bool invertLightness;
  final VisibilityRule visibility;
  final Color color;
  final int weight;

  const StyleRules({
    this.hue,
    this.lightness,
    this.saturation,
    this.gamma,
    this.invertLightness,
    this.visibility,
    this.color,
    this.weight,
  })  : assert(
          lightness == null && (lightness >= -100 && lightness <= 100),
          "lightness argument must be in range -100 to 100",
        ),
        assert(
          saturation == null && (saturation >= -100 && saturation <= 100),
          "saturation argument must be in range -100 to 100",
        ),
        assert(
          gamma == null && (gamma >= 0.01 && gamma <= 10.0),
          "gamma argument must be in range -100 to 100",
        ),
        assert(
            hue != null ||
                lightness != null ||
                saturation != null ||
                gamma != null ||
                invertLightness != null ||
                visibility != null ||
                color != null ||
                weight != null,
            "at least one rule must be provided");
}

class StaticMapStyle {
  final StyleFeature feature;
  final StyleElement element;
  final StyleRules rules;

  StaticMapStyle({
    this.element,
    this.feature,
    this.rules,
  });
}

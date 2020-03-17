part of google_static_maps_controller;

class _StyleAdministrative extends StyleFeature {
  const _StyleAdministrative() : super._("administrative");

  /// Selects countries.
  final country = const StyleFeature._("administrative.country");

  /// Selects land parcels.
  final landParcel = const StyleFeature._("administrative.land_parcel");

  /// Selects localities.
  final locality = const StyleFeature._("administrative.locality");

  /// Selects neighborhoods.
  final neighborhood = const StyleFeature._("administrative.neighborhood");

  /// Selects provinces.
  final province = const StyleFeature._("administrative.province");
}

class _StyleLandscapeNatural extends StyleFeature {
  const _StyleLandscapeNatural() : super._("landscape.natural");

  /// Selects land cover features, the physical material that covers the earth's surface, such as forests, grasslands, wetlands, and bare ground.
  final landcover = const StyleFeature._("landscape.natural.landcover");

  /// Selects terrain features of a land surface, such as elevation, slope, and orientation.
  final terrain = const StyleFeature._("landscape.natural.terrain");
}

class _StyleLandscape extends StyleFeature {
  const _StyleLandscape() : super._("landscape");

  /// Selects man-made features, such as buildings and other structures.
  final manMade = const StyleFeature._("landscape.man_made");

  /// Selects natural features, such as mountains, rivers, deserts, and glaciers.
  final natural = const _StyleLandscapeNatural();
}

class _StylePoi extends StyleFeature {
  const _StylePoi() : super._("poi");

  /// Selects tourist attractions.
  final attraction = const StyleFeature._("poi.attraction");

  /// Selects businesses.
  final business = const StyleFeature._("poi.business");

  /// Selects government buildings.
  final government = const StyleFeature._("poi.government");

  /// Selects emergency services, including hospitals, pharmacies, police, doctors, and others.
  final medical = const StyleFeature._("poi.medical");

  /// Selects parks.
  final park = const StyleFeature._("poi.park");

  /// Selects places of worship, including churches, temples, mosques, and others.
  final placeOfWorship = const StyleFeature._("poi.place_of_worship");

  /// Selects schools.
  final school = const StyleFeature._("poi.school");

  /// Selects sports complexes.
  final sportsComplex = const StyleFeature._("poi.sports_complex");
}

class _StyleRoadHighway extends StyleFeature {
  const _StyleRoadHighway() : super._("road.highway");

  /// Selects highways with controlled access.
  final controlledAccess =
      const StyleFeature._("landscape.natural.controlled_access");
}

class _StyleRoad extends StyleFeature {
  const _StyleRoad() : super._("road");

  /// Selects arterial roads.
  final arterial = const StyleFeature._("road.arterial");

  /// Selects highways.
  final highway = const _StyleRoadHighway();

  /// Selects local roads.
  final local = const StyleFeature._("road.local");
}

class _StyleTransitStation extends StyleFeature {
  const _StyleTransitStation() : super._("transit.station");

  /// Selects airports.
  final airport = const StyleFeature._("transit.station.airport");

  /// Selects bus stops.
  final bus = const StyleFeature._("transit.station.bus");

  /// Selects rail stations.
  final rail = const StyleFeature._("transit.station.rail");
}

class _StyleTransit extends StyleFeature {
  const _StyleTransit() : super._("transit");

  /// Selects transit lines.
  final line = const StyleFeature._("transit.line");

  /// Selects all transit stations.
  final station = const _StyleTransitStation();
}

class StyleFeature {
  final String value;
  const StyleFeature._(this.value);

  /// Selects all features.
  static const all = StyleFeature._("all");

  /// Selects all administrative areas. Styling affects only the labels of administrative areas, not the geographical borders or fill.
  static const administrative = _StyleAdministrative();

  /// Selects all landscapes.
  static const landscape = _StyleLandscape();

  /// Selects all points of interest.
  static const poi = _StylePoi();

  /// Selects all roads.
  static const road = _StyleRoad();

  /// Selects all transit stations and lines.
  static const transit = _StyleTransit();

  /// selects bodies of water.
  static const water = StyleFeature._("water");
}

part of google_static_maps_controller;

class _StyleAdministrative extends StyleFeature {
  const _StyleAdministrative() : super._("administrative");

  /// Selects countries.
  static const country = StyleFeature._("administrative.country");

  /// Selects land parcels.
  static const landParcel = StyleFeature._("administrative.land_parcel");

  /// Selects localities.
  static const locality = StyleFeature._("administrative.locality");

  /// Selects neighborhoods.
  static const neighborhood = StyleFeature._("administrative.neighborhood");

  /// Selects provinces.
  static const province = StyleFeature._("administrative.province");
}

class _StyleLandscapeNatural extends StyleFeature {
  const _StyleLandscapeNatural() : super._("landscape.natural");

  /// Selects land cover features, the physical material that covers the earth's surface, such as forests, grasslands, wetlands, and bare ground.
  static const landcover = StyleFeature._("landscape.natural.landcover");

  /// Selects terrain features of a land surface, such as elevation, slope, and orientation.
  static const terrain = StyleFeature._("landscape.natural.terrain");
}

class _StyleLandscape extends StyleFeature {
  const _StyleLandscape() : super._("landscape");

  /// Selects man-made features, such as buildings and other structures.
  static const manMade = StyleFeature._("landscape.man_made");

  /// Selects natural features, such as mountains, rivers, deserts, and glaciers.
  static const natural = _StyleLandscapeNatural();
}

class _StylePoi extends StyleFeature {
  const _StylePoi() : super._("poi");

  /// Selects tourist attractions.
  static const attraction = StyleFeature._("poi.attraction");

  /// Selects businesses.
  static const business = StyleFeature._("poi.business");

  /// Selects government buildings.
  static const government = StyleFeature._("poi.government");

  /// Selects emergency services, including hospitals, pharmacies, police, doctors, and others.
  static const medical = StyleFeature._("poi.medical");

  /// Selects parks.
  static const park = StyleFeature._("poi.park");

  /// Selects places of worship, including churches, temples, mosques, and others.
  static const placeOfWorship = StyleFeature._("poi.place_of_worship");

  /// Selects schools.
  static const school = StyleFeature._("poi.school");

  /// Selects sports complexes.
  static const sportsComplex = StyleFeature._("poi.sports_complex");
}

class _StyleRoadHighway extends StyleFeature {
  const _StyleRoadHighway() : super._("road.highway");

  /// Selects highways with controlled access.
  static const controlledAccess =
      StyleFeature._("landscape.natural.controlled_access");
}

class _StyleRoad extends StyleFeature {
  const _StyleRoad() : super._("road");

  /// Selects arterial roads.
  static const arterial = StyleFeature._("road.arterial");

  /// Selects highways.
  static const highway = _StyleRoadHighway();

  /// Selects local roads.
  static const local = StyleFeature._("road.local");
}

class _StyleTransitStation extends StyleFeature {
  const _StyleTransitStation() : super._("transit.station");

  /// Selects airports.
  static const airport = StyleFeature._("transit.station.airport");

  /// Selects bus stops.
  static const bus = StyleFeature._("transit.station.bus");

  /// Selects rail stations.
  static const rail = StyleFeature._("transit.station.rail");
}

class _StyleTransit extends StyleFeature {
  const _StyleTransit() : super._("transit");

  /// Selects transit lines.
  static const line = StyleFeature._("transit.line");

  /// Selects all transit stations.
  static const station = _StyleTransitStation();
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

part of google_static_maps_controller;

enum MapImageFormat {
  png8,
  png32,
  gif,
  jpg,
  jpgBaseline,
}

extension MapImageFormatExtension on MapImageFormat {
  String get value {
    switch (this) {
      case MapImageFormat.gif:
        return "gif";
      case MapImageFormat.jpg:
        return "jpg";
      case MapImageFormat.jpgBaseline:
        return "jpg-baseline";
      case MapImageFormat.png8:
        return "png8";
      case MapImageFormat.png32:
        return "png32";
      default:
        return null;
    }
  }
}

enum StaticMapType {
  roadmap,
  satellite,
  terrain,
  hybrid,
}

extension StaticMapTypeExtension on StaticMapType {
  String get value {
    switch (this) {
      case StaticMapType.roadmap:
        return "roadmap";
      case StaticMapType.satellite:
        return "satellite";
      case StaticMapType.hybrid:
        return "hybrid";
      case StaticMapType.terrain:
        return "terrain";
      default:
        return null;
    }
  }
}

enum MarkerSize {
  tiny,
  mid,
  small,
}

extension MarkerSizeExtension on MarkerSize {
  String get value {
    switch (this) {
      case MarkerSize.tiny:
        return "tiny";
      case MarkerSize.small:
        return "small";
      case MarkerSize.mid:
        return "mid";
      default:
        return null;
    }
  }
}

enum MapScale {
  scale1,
  scale2,
  scale4,
}

extension MapScaleExtension on MapScale {
  String get value {
    switch (this) {
      case MapScale.scale1:
        return "1";
      case MapScale.scale2:
        return "2";
      case MapScale.scale4:
        return "4";
      default:
        return null;
    }
  }
}

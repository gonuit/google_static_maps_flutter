## 1.0.0-dev.1

- **BREAKING CHANGE** To draw a circle path use `Path.circle` instead of `Path` constructor.
  - Added optional `detail` parameter.
- Added encoded polylines support.
  - Added `Path.encodedPolyline` constructor.
  - Added `encoded` property to the `Path` and `Path.circle` constructors.
  - Added `PolylineEncoder` encoder.
- Removed redundant white spaces from the genrated urls.
- Added support for arithmetic operators to the `Location` class.
- Added `GeocodedLocation` with the constructors `address` and `latLng`, which allows the user to define parameters such as `center` and `visible` not only by the lng lat values, but also by addresses.
- Allow using addresses in paths and markers.
- Updated example app.

## 0.6.0

- Added support for path circles.
- Added additional check for max url size.
- Documentation changes.

## 0.5.0

- Added support for null stafety.
- `Path` and `Marker` will now throw errors when `toUrlString` is called and minimum required elements are not provided.

## 0.4.3

- Added `mapId` argument (support for cloud-based map styling).

## 0.4.1

- Added package license.

## 0.4.0

- Added support for paths (`Path` class).

## 0.3.0

- Added support for map styling.

## 0.2.0

- Added support for custom markers
  - Added `Marker.custom` constructor that allows using custom marker icons.

## 0.1.0

- Improved readme file.
- Provide screen with example.

## 0.0.1

- Added example application.
- Initial release.

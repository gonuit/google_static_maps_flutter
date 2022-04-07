# google_static_maps_controller
[![Codemagic build status](https://api.codemagic.io/apps/5e70ce446e13eb493ea3b675/5e70ce446e13eb493ea3b674/status_badge.svg)](https://codemagic.io/apps/5e70ce446e13eb493ea3b675/5e70ce446e13eb493ea3b674/latest_build)

The package provides simple and declarative access to the Google Static Maps service.

| Feature                 | Status |
| :---------------------- | :----: |
| Base Static map support |   ✅    |
| Zoom levels             |   ✅    |
| Image sizes             |   ✅    |
| Map types               |   ✅    |
| Markers                 |   ✅    |
| Map styles              |   ✅    |
| Paths                   |   ✅    |
| Encoded Polylines       |   ✅    |
| Viewports               |   ⚙️    |


✅ - done  
🧪 - experimental  
⚙️  - work in progress  
❌ - not yet implemented 

## Example:
![map_screenshot](./readme/screen.png)

## Getting Started

### StaticMap widget:
```dart
// ***

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// Declare your static map
        child: StaticMap(
          width: 400,
          height: 400,
          scaleToDevicePixelRatio: true,
          googleApiKey: "<GOOGLE_API_KEY>",
          paths: <Path>[
            Path.circle(
              center: GeocodedLocation.latLng(-3.265628, -59.994832),
              radius: 5000, // meters
              weight: 2,
              color: Colors.blue,
              fillColor: Colors.red.withOpacity(0.5),
            ),
            Path(
              weight: 2,
              color: Colors.blue,
              fillColor: Colors.purple.withOpacity(0.5),
              points: <Location>[
                Location(-3.220028, -59.924832),
                Location(-3.234028, -59.964832),
                Location(-3.265628, -59.994832),
                Location(-3.261128, -59.947832),
                Location(-3.216728, -59.895832),
                Location(-3.220028, -59.924832),
              ],
            ),
            Path(
              weight: 3,
              color: Colors.blue,
              points: <Location>[
                Location(-3.352538, -60.163816),
                Location(-3.314760, -60.050712),
                Location(-3.364583, -59.942379),
                Location(-3.268667, -59.901430),
                Location(-3.198791, -59.876131),
              ],
            )
          ],
          /// Declare optional markers
          markers: <Marker>[
            /// Define marker style
            Marker(
              color: Colors.lightBlue,
              label: "A",
              locations: [
                /// Provide locations for markers of a defined style
                Location(-3.1178833, -60.0029284),
                Location(-3.1467579, -59.8753814),
              ],
            ),
            /// Define another marker style with custom icon
            Marker.custom(
              anchor: MarkerAnchor.bottom,
              icon: "https://goo.gl/1oTJ9Y",
              locations: [
                Location(-3.1694166, -60.1041517),
              ],
            )
          ],
        ),
      ),
    );
  }

// ***
```

### StaticMapController
```dart
  Widget build(BuildContext context) {
    /// Declare static map controller
     const _controller = StaticMapController(
      googleApiKey: "<GOOGLE_API_KEY>",
      width: 400,
      height: 400,
      zoom: 10,
      center: GeocodedLocation.latLng(-3.1178833, -60.0029284),
    );

    /// Get map image provider from controller.
    /// You can also get image url by accessing
    /// `_controller.url` property.
    ImageProvider image = _controller.image;

    return Scaffold(
      body: Center(
        /// Display as a normal network image
        child: Image(image: image),
      ),
    );
  }
```


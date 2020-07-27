# google_static_maps_controller
[![Codemagic build status](https://api.codemagic.io/apps/5e70ce446e13eb493ea3b675/5e70ce446e13eb493ea3b674/status_badge.svg)](https://codemagic.io/apps/5e70ce446e13eb493ea3b675/5e70ce446e13eb493ea3b674/latest_build)

The package provides simple access to the Google Static Maps service.

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
      center: Location(-3.1178833, -60.0029284),
    );

    /// Get URL of the declared static map
    String mapImageUrl = _controller.url.toString();

    return Scaffold(
      body: Center(
        /// Display as a normal network image
        child: Image.network(
          mapImageUrl,
        ),
      ),
    );
  }
```

| Feature                 | Status |
| :---------------------- | :----: |
| Base Static map support |   ✅    |
| Zoom levels             |   ✅    |
| Image sizes             |   ✅    |
| Map types               |   ✅    |
| Markers                 |   ✅    |
| Map styles              |   ✅    |
| Paths                   |   ✅    |
| Encoded Polylines       |   ❌    |
| Viewports               |   ⚙️    |


✅ - done  
🧪 - experimental  
⚙️  - work in progress  
❌ - not yet implemented 

## Example:
![map_screenshot](./readme/screen.png)
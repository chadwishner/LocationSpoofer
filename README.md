# LocationSpoofer

A minimal iOS app that loads a `.gpx` file onto a device to spoof its GPS location via Xcode's simulated location feature.

## Usage

1. Open `LocationSpoofer.xcodeproj` in Xcode.
2. Add or edit `.gpx` files in the project with your desired coordinates.
3. Run the app on a device or simulator.
4. In Xcode, go to **Debug → Simulate Location** and select your `.gpx` file.

The app displays the current latitude and longitude reported by Core Location, so you can verify the spoofed location is active.

## Requirements

- Xcode 15+
- iOS 16+

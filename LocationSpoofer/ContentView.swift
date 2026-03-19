//
//  ContentView.swift
//  LocationSpoofer
//
//  Created by Chad Wishner on 3/13/25.
//

import SwiftUI
import CoreLocation
import Combine

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Text("Latitude: \(locationManager.latitude)")
            Text("Longitude: \(locationManager.longitude)")
        }
        .padding()
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.latitude = location.coordinate.latitude
                self.longitude = location.coordinate.longitude
            }
        }
    }
}


#Preview {
    ContentView()
}

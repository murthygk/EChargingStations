//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation
import CoreLocation
import Combine

enum LocationError: Error {
    case didUpdateError
    case didUpdateWithInvalidLocation
}

struct Location {
    let latitude: Double
    let longitude: Double
}

protocol LocationManagerProtocol {
    var locationUpdatePublisher: PassthroughSubject<Location, LocationError> { get }
    func requestLocation()
}

class LocationManager: NSObject, LocationManagerProtocol {
    private let manager = CLLocationManager()

    public let locationUpdatePublisher = PassthroughSubject<Location, LocationError>()

    override init() {
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }

    func requestLocation() {
        manager.requestLocation()
    }

}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.first?.coordinate else {
            locationUpdatePublisher
                .send(completion: Subscribers.Completion.failure(.didUpdateWithInvalidLocation))
            return
         }

        let currentLoc = Location(
            latitude: location.latitude,
            longitude: location.longitude
        )

        locationUpdatePublisher.send(currentLoc)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
                    locationUpdatePublisher
                        .send(completion: Subscribers.Completion.failure(.didUpdateWithInvalidLocation))
    }
}

struct ChargingStation {
    let name:String? = "Dummy"
}

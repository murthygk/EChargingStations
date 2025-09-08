//
//  EChargingStationsApp.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import SwiftUI

@main
struct EChargingStationsApp: App {
    var body: some Scene {
        WindowGroup {
            ChargingStationsView(viewModel: ChargingStationsViewModel(locationManager: LocationManager(),
                                                                      networkService: NetworkService()
                                                                     )
            )
        }
    }
}

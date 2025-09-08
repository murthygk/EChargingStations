    //
    //  ChargingStationsView.swift
    //  WeatherApp
    //
    //  Created by Gudipati, Krishna on 9/7/25.
    //

import SwiftUI

struct ChargingStationsView: View {
    @StateObject var viewModel: ChargingStationsViewModel
    var body: some View {
        NavigationView {
            List(viewModel.chargingStations, id: \.self) { station in
                NavigationLink(value: station) {
                    VStack (alignment: .leading) {
                        Text(station.name)
                        Text(station.address)
                        Text(station.locationInfo)
                    }
                }
            }
            .navigationTitle("EV Charging Stations")
        }

    }
}

#Preview {
    let networkService = NetworkService()
    let locationManager = LocationManager()
    let viewModel = ChargingStationsViewModel(
        locationManager: locationManager,
        networkService: networkService
    )
    ChargingStationsView(viewModel: viewModel)
}

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
        // Text(viewModel.chargingStations?.stations.first ?? " No data yet")
        Text(" No data yet")
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

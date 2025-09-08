//
//  ChargingStationsViewModel.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation
import Combine

class ChargingStationsViewModel: ObservableObject {
    private let locationManager: LocationManagerProtocol?
    private let networkService: NetworkServiceProtocol?

    var cancellables = Set<AnyCancellable>()
    @Published var chargingStations: ChargingStations?

    init(
        locationManager: LocationManagerProtocol?,
        networkService: NetworkServiceProtocol?
    ) {
        self.locationManager = locationManager
        self.networkService = networkService
        self.locationManager?.requestLocation()
        self.locationManager?.locationUpdatePublisher
            .sink(receiveCompletion: { completion in
                print(completion)
            },
                  receiveValue: { [weak self] location in

                Task { @MainActor in
                    self?.chargingStations = try await networkService?
                        .fetchStations(nearBy: location)
                }
            }
            ).store(in: &cancellables)
    }
}


//
//  ChargingStationsViewModelTests.swift
//  EChargingStationsTests
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Testing

@testable import EChargingStations

struct ChargingStationsViewModelTests {

    private let viewModelSUT: ChargingStationsViewModel
    private let locationManagerMock: LocationManagerMock
    private let networkServiceMock: NetworkServiceMock

    init() {
        locationManagerMock = LocationManagerMock()
        networkServiceMock = NetworkServiceMock()
        viewModelSUT = ChargingStationsViewModel(
            locationManager: locationManagerMock,
            networkService: networkServiceMock
        )
    }

    @Test func testEmptyStations() async throws {
        // GIVEN
        networkServiceMock.setEmptyListOfStations()
        // WHEN
        let stations = viewModelSUT.chargingStations
        // THEN
        #expect(stations.isEmpty)
    }

}

class NetworkServiceMock: NetworkServiceProtocol {
    var chargingStations: [ChargingStation]?

    func setEmptyListOfStations() {
        chargingStations = []
    }

    func fetchStations(nearBy: EChargingStations.Location) async throws -> [EChargingStations.ChargingStation]? {
        return chargingStations
    }
}



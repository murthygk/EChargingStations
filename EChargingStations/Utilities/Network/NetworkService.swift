//
//  NetworkService.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchStations(nearBy: Location) async throws -> [ChargingStation]?
}

struct NetworkService: NetworkServiceProtocol {
    func fetchStations(nearBy: Location) async throws -> [ChargingStation]? {
        return [ChargingStation()]
    }
}

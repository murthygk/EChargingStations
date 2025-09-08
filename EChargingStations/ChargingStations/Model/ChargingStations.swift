//
//  ChargingStations.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/8/25.
//


struct ChargingStations {
    let stations: [ChargingStation]
}

struct StationInfo {
    let name: String
    let address: String
    let locationInfo: String
}

struct StationDetailsInfo {
    let location: Location
    let connectorType: String
    let address: String
    let accessComments: String
}
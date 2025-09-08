//
//  ChargingStation.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/8/25.
//

import Foundation

struct ChargingStation: Decodable, Hashable {
    let id: UUID = UUID()
    enum CodingKeys: String, CodingKey {
        case addressInfo = "AddressInfo"
        case connections = "Connections"
    }
    private let addressInfo: AddressInfo?
    private let connections: [ConnectionInfo]?
}

extension ChargingStation {

    var locationInfo: String {
        return addressInfo?.locationInfo ?? "No location info"
    }

    private var name: String {
        return addressInfo?.name ?? "No Name"
    }

    private var address: String {
        return addressInfo?.address ?? "No address"
    }

    private var accessComments: String {
        return addressInfo?.comments ?? "No Comments"
    }

    private var connectorType: String {
        return connections?.first?.connectorType ?? "No connector Info"
    }
}

extension ChargingStation {
    var stationInfo: StationInfo {
        return StationInfo(
            name: name,
            address: address,
            locationInfo: locationInfo
        )
    }

    var stationDetialsInfo: StationDetailsInfo {
        return StationDetailsInfo(
            location: addressInfo?.geoLocation ?? Location(
                latitude: 0,
                longitude: 0
            ),
            connectorType: connectorType,
            address: address,
            accessComments: accessComments
        )
    }
}

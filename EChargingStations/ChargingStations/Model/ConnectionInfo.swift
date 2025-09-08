//
//  ConnectionInfo.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation

struct ConnectionInfo: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case connectionTypeId = "ConnectionTypeID"
        case connectionType = "ConnectionType"
        case reference = "Reference"
        case levelId = "LevelID"
        case level = "Level"
        case amps = "Amps"
        case voltage = "Voltage"
        case powerKW = "PowerKW"
        case currentTypeId = "CurrentTypeID"
        case currentType = "CurrentType"
    }
    private let id: Int?
    private let connectionTypeId: Int?
    private let connectionType: ConnectionType?
    private let reference: String?
    private let levelId: Int?
    private let level: ConnectionLevel?
    private let amps: Int?
    private let voltage: Int?
    private let powerKW: Double?
    private let currentTypeId: Int?
    private let currentType: CurrentType?

    var connectorType: String {
        return connectionType?.connectorTypeInfo ?? "No connector Info"
    }
}

struct ConnectionType: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case type = "ConnectionType"
        case formalName = "FormalName"
        case isDiscontinued = "IsDiscontinued"
        case isObsolete = "IsObsolete"
        case id = "ID"
        case title = "Title"
    }
    private let type: String?
    private let formalName: String?
    private let isDiscontinued: Bool?
    private let isObsolete: Bool?
    private let id: Int?
    private let title: String?

    var connectorTypeInfo: String {
        var info = ""
        if let title {
            info.append(title)
        }
        if let formalName {
            info.append(formalName)
        }
        return info
    }
}

struct ConnectionLevel: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case comments = "Comments"
        case isFastChargeCapable = "IsFastChargeCapable"
        case id = "ID"
        case title = "Title"
    }

    private let comments: String?
    private let isFastChargeCapable: Bool?
    private let id: Int?
    private let title: String?
}

struct CurrentType: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case description = "Description"
        case id = "ID"
        case title = "Title"
    }

    private let description: String?
    private let id: Int?
    private let title: String?
}

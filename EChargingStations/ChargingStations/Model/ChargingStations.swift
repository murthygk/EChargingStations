//
//  ChargingStations.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation

struct ChargingStation: Decodable, Hashable {
    let id: UUID = UUID()
    enum CodingKeys: String, CodingKey {
        case addressInfo = "AddressInfo"
        case connections = "Connections"
    }
    private let addressInfo: AddressInfo?
    private let connections: [Connection]?

    var name: String {
        return addressInfo?.name ?? "No Name"
    }

    var address: String {
        return addressInfo?.address ?? "No address"
    }

    var locationInfo: String {
        return addressInfo?.locationInfo ?? "No location info"
    }

    var accessComments: String {
        return addressInfo?.comments ?? "No Comments"
    }

    var connectorType: String {
        return connections?.first?.connectorType ?? "No connector Info"
    }
}

struct AddressInfo: Decodable, Hashable {

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case city = "Town"
        case state = "StateOrProvince"
        case zipCode = "Postcode"
        case countryId = "CountryID"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case phone1 = "ContactTelephone1"
        case phone2 = "ContactTelephone2"
        case email = "ContactEmail"
        case accessComments = "AccessComments"
        case url = "RelatedURL"
        case distance = "Distance"
        case unit = "DistanceUnit"
    }

    private let id: Int?
    private let title: String?
    private let addressLine1: String?
    private let addressLine2: String?
    private let city: String?
    private let state: String?
    private let zipCode: String?
    private let countryId: Int?
    private let latitude: Double
    private let longitude: Double
    private let phone1: String?
    private let phone2: String?
    private let email: String?
    private let accessComments: String?
    private let url: String?
    private let distance: Double?
    private let unit: Int?

    var name: String {
        return title ?? "No Title"
    }

    var address: String {
        var address: String = ""

        if let address1 = addressLine1 {
            address.append(address1)
        }

        if let address2 = addressLine2 {
            address.append("," + address2)
        }

        if let city = city {
            address.append("\n" + city)
        }

        if let state = state {
            address.append("," + state)
        }

        if let zipCode = zipCode {
            address.append("," + zipCode)
        }
        return address
    }

    var geoLocation: Location {
        return Location(latitude: latitude, longitude: longitude)
    }

    var locationInfo: String {
        guard let distance else {
            return ""
        }

        return "Located at \(distance) miles" // Assuming miles by default
    }

    var comments: String {
        return accessComments ?? "No Comments"
    }
}

struct Connection: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case connectionTypeId = "ConnectionTypeID"
        case connectionType
        case reference = "Reference"
        case levelId = "LevelID"
        case level
        case amps = "Amps"
        case voltage = "Voltage"
        case powerKW = "PowerKW"
        case currentTypeId = "CurrentTypeID"
        case currentType
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

struct ChargingStations {
    let stations: [ChargingStation]
}

struct StationInfo {
    let name: String
    let address: String
    let locationInfo: String
}


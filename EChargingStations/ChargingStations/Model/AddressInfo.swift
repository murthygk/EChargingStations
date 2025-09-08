//
//  AddressInfo.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/8/25.
//

import Foundation

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

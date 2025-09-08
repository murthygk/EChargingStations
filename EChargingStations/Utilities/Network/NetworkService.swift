//
//  NetworkService.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Foundation

enum OpenChargeMapAPI {
    static let APIKey = "8cd69854-11f0-448d-a413-bb48e6d8c3f8"
    struct URL {
        static let mainPath = "https://api.openchargemap.io/v3/poi/"
        static let parameterAPIKey = "key"
        static let parameterOutput = "output"
        static let parameterOutputValue = "json"
        static let parameterCountryCode = "countrycode"
        static let parameterCountryCodeValue = "US"
        static let parameterMaxResults = "maxresults"
        static let parameterMaxResultsValue = "100"
        static let parameterCompact = "compact"
        static let parameterCompactValue = "true"
        static let parameterVerbose = "verbose"
        static let parameterVerboseValue = "false"
        static let parameterLatitude = "latitude"
        static let parameterLongitude = "longitude"
        static let parameterDistance = "distance"

    }
    struct Constants {
        static let distance = 50
    }

    static func buildUrl(latitude: Double, longitude: Double) -> String {
        return OpenChargeMapAPI.URL.mainPath
                + "?"
                + OpenChargeMapAPI.URL.parameterAPIKey
                + "="
                + OpenChargeMapAPI.APIKey
                + "&"
                + OpenChargeMapAPI.URL.parameterCountryCode
                + "="
                + OpenChargeMapAPI.URL.parameterCountryCodeValue
                + "&"
                + OpenChargeMapAPI.URL.parameterLatitude
                + "="
                + "\(latitude)"
                + "&"
                + OpenChargeMapAPI.URL.parameterLatitude
                + "="
                + "\(longitude)"
                + "&"
                + OpenChargeMapAPI.URL.parameterDistance
                + "="
                + "\(OpenChargeMapAPI.Constants.distance)"
    }
}

enum NetworkError: Error {
    case invalidURL(String)
    case responseCodeError(String)
    case decodeError(String)
}

protocol NetworkServiceProtocol {
    func fetchStations(nearBy: Location) async throws -> ChargingStations?
}

struct NetworkService: NetworkServiceProtocol {

    func fetchStations(nearBy location: Location) async throws -> ChargingStations? {
        // example : https://api.openchargemap.io/v3/poi/?output=json&countrycode=US&maxresults=100&compact=true&verbose=false&key=8cd69854-11f0-448d-a413-bb48e6d8c3f8
        let urlString = OpenChargeMapAPI.buildUrl(latitude: location.latitude ,longitude: location.longitude)

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL("Not able to build URL")
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = (response as? HTTPURLResponse), response.statusCode == 200 else {
                throw NetworkError.responseCodeError("Error: StatusCode is not equal to 200")
            }
            let stations = try JSONDecoder().decode([ChargingStation].self, from: data )
            return ChargingStations(stations: stations)
        } catch let error as DecodingError {
            throw NetworkError
                .decodeError("Could not decode the data : \(error.localizedDescription)")
        } catch let error as URLError {
            throw NetworkError.responseCodeError("Network Error : \(error.localizedDescription)")
        }
    }
}


/*
 static var buildUrl: String {
 return OpenChargeMapAPI.URL.mainPath
 + "?"
 + OpenChargeMapAPI.URL.parameterAPIKey
 + "="
 + OpenChargeMapAPI.APIKey
 + "&"
 + OpenChargeMapAPI.URL.parameterOutput
 + "="
 + OpenChargeMapAPI.URL.parameterOutputValue
 + "&"
 + OpenChargeMapAPI.URL.parameterCountryCode
 + "="
 + OpenChargeMapAPI.URL.parameterCountryCodeValue
 + "&"
 + OpenChargeMapAPI.URL.parameterMaxResults
 + "="
 + OpenChargeMapAPI.URL.parameterMaxResultsValue
 + "&"
 + OpenChargeMapAPI.URL.parameterCompact
 + "="
 + OpenChargeMapAPI.URL.parameterCompactValue
 + "&"
 + OpenChargeMapAPI.URL.parameterVerbose
 + "="
 + OpenChargeMapAPI.URL.parameterVerboseValue
 }
 */

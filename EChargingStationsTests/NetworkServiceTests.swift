//
//  NetworkServiceTests.swift
//  EChargingStationsTests
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import Testing
import Combine

@testable import EChargingStations

struct NetworkServiceTests {

    @Test("HTTPResponse Error")
    func testHTTPResponseError() async throws {
    }

    @Test("JSON Decoding tests")
    func testJSONDecodeError() async throws {
    }

}

class LocationManagerMock: LocationManagerProtocol {
    var locationUpdatePublisher = PassthroughSubject<Location, LocationError>()

    func requestLocation() {

    }
}

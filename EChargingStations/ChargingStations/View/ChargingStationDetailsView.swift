//
//  ChargingStationDetailsView.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import SwiftUI
import MapKit

struct ChargingStationDetailsView: View {
    let stationDetails: StationDetailsInfo
    var body: some View {
        Spacer()
        MapView(location: stationDetails.location)
            .frame(width: 300, height: 250)
        Spacer()
        VStack {
            Text(stationDetails.connectorType)
            Text(stationDetails.address)
            Text(stationDetails.accessComments)
        }
        Spacer()
    }
}

struct MapView: View {
    let location: Location

    var body: some View {
        Map(initialPosition: .region(region))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: location.latitude,
                longitude: location.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    ChargingStationDetailsView(
        stationDetails: StationDetailsInfo(
            location: Location(
                latitude: 0,
                longitude: 0
            ),
            connectorType: "Type 1 charger",
            address: "Near you",
            accessComments: "Excellent"
        )
    )
}

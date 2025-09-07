//
//  ChargingStations.swift
//  EChargingStations
//
//  Created by Gudipati, Krishna on 9/7/25.
//

import SwiftUI

struct ChargingStations: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<15, id: \.self) { stationNumber in
                    Station(
                        name: "Station \(stationNumber)",
                        addressLine1: "AddressLine1 \(stationNumber)",
                        addressLine2: "AddressLine2 \(stationNumber)",
                        location:  "Atlanta - \(stationNumber)"
                    )
                }
            }
            .padding()
        }

    }
}

struct Station: View {
    let name: String
    let addressLine1: String
    let addressLine2: String
    let location: String

    var body: some View {
        VStack {
            Text(name)
            Text(addressLine1)
            Text(addressLine2)
            Text(location)
        }
    }
}

#Preview {
    ChargingStations()
}

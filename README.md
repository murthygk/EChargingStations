App is implemented in Swift/SwiftUI and used only iOS frameworks and targetted to iOS ver 17.6+
MVVM architecture is followed with:

  Models -> ChargingStation represents a single charging station with AddressInfo and an array of Connections
            All the properties are optional and private. Computed properties are used to fetch a single info or a combination
            
  Services -> LocationManager conforming to LocationManagerProtocol interacing with a publisher emiting Location(lat, long) and requestLocation() method. It uses CoreLocation to get location updates.
              NetworkService conforming to NetworkServiceProtocol interfacing with fetchStations(lat, long) and returning an array of Charging stations

  ViewModel -> ChargingStationsViewModel conforms to ObservableObject and injected with LocationManager and NetworkService. It subscribes to LocationManger to get location udpate and
               based on that it reaches NetworkSergice to get list of stations providing lat/long

  View -> ChargingStationsListView is a swiftUI view having @StateObject with ChargingStationsViewModel which feeds all the information need to display as well as for detail view
          Stations list is displayed using `List` Embeded in NavigationView. Each list item is linked with NavigationLink with destination providing a single station information
          ChargingStationDetailsView is a child view with station ifo. It shows Map() with lat/long at the top and connection info and address are displayed below the map. Annotations not used at this time.


INSTLLATION :

Clone this repo and run in XCode 16+ with iOS 17.6

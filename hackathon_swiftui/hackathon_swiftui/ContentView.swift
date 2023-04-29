import SwiftUI
import MapKit


struct ContentView: View {
        let parkingLots = [
            ParkingLot(name: "Parking Lot 1", address: "Address 1", coordinate: CLLocationCoordinate2D(latitude: 19.431952, longitude: -99.133254)),
            ParkingLot(name: "Parking Lot 2", address: "Address 2", coordinate: CLLocationCoordinate2D(latitude: 19.429749, longitude: -99.136491)),
            ParkingLot(name: "Parking Lot 3", address: "Address 3", coordinate: CLLocationCoordinate2D(latitude: 19.435408, longitude: -99.142398))
        ]
        @State var selectedParkingLot: ParkingLot?
        
        var body: some View {
            VStack {
                Text("Bienvenido usuario").font(.title).padding()
                MapView(parkingLots: parkingLots, selectedParkingLot: $selectedParkingLot) { parkingLot in
                    // Handle parking spot request
                    print("Requested parking spot for \(parkingLot.name)")
                }.frame(height: 300)
                if let parkingLot = selectedParkingLot {
                    ParkingLotDetailViewWithReview(parkingLot: parkingLot) { parkingLot in
                        // Handle parking spot request
                        print("Requested parking spot for \(parkingLot.name)")
                    }
                }
                Spacer()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

import SwiftUI

struct ParkingLotDetailView: View {
    
    let parkingLot: ParkingLot
    let onRequestParkingSpot: (ParkingLot) -> Void
    
    var body: some View {
        VStack {
            Text(parkingLot.name).font(.title).foregroundColor(.primary)
            Text(parkingLot.address).font(.subheadline).foregroundColor(.secondary)
            NavigationLink(destination: ViewPark(nombreEstacionamiento: parkingLot.name)) {
                Text("Solicitar lugar")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
            }
            
        }
        
    }
    
}

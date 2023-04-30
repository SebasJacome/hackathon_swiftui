import SwiftUI
import MapKit
struct PrincipalView: View {
    @State var path = NavigationPath()
    let cdmxRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.431952, longitude: -99.133254), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State var parkingLots  = [ParkingLot]()
    @State var selectedParkingLot: ParkingLot?
    @ObservedObject var parkings = parking()
    
    var body: some View {
        NavigationStack (path: $path) {
            ZStack(alignment: .bottom) {
                MapView(parkingLots: parkingLots, selectedParkingLot: $selectedParkingLot) { parkingLot in
                    // Handle parking spot request
                    print("Requested parking spot for \(parkingLot.name)")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                
                
                
                if let parkingLot = selectedParkingLot {
                    VStack(spacing: 16) {
                        ParkingLotDetailViewWithReview(parkingLot: parkingLot) { parkingLot in
                            // Handle parking spot request
                            print("Requested parking spot for \(parkingLot.name)")
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 8)
                    }
                    .frame(maxWidth: 400)
                    .padding()
                    .transition(.move(edge: .bottom))
                }
            }
            
           
            .navigationBarTitle(Text("Park-a-lot")
)
            
            .foregroundColor(.white)
            .padding(10)
            .bold()
            
            .background(Color.white) .cornerRadius(0)
            
            
            .navigationBarItems(leading:  ZStack{
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                (Image(systemName: "car.side")
                    .frame(width:40,height:40)
                    .foregroundColor(.white).bold())
            })
            
            
            .navigationBarItems(trailing: NavigationLink(destination: ReservationsView()) { Text(" Mis Reservaciones ") .padding(5)
                .foregroundColor(.white)
                .background(Color.gray)
                .bold()
                .font(.title3)
                .cornerRadius(15) })
           
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.gray)
        .onAppear {
            loadEstacionamientos()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func loadEstacionamientos() {
        
        
        for i in parkings.parks {
            let latitud = Double(i.cLatitud)
            let longitud = Double(i.cLongitud)
            let coordinate = CLLocationCoordinate2D(latitude: latitud!, longitude: longitud!)
            let name = i.nombre
            let add = i.direccion
            
            let createdLot = ParkingLot(name: name, address: add, coordinate: coordinate)
            parkingLots.append(createdLot)
        }
                    
        
    }
    
    func generateRandomParkingLots() {
        let numParkingLots = 1000
        let minLatitude = 19.000000
        let maxLatitude = 19.600000
        let minLongitude = -99.300000
        let maxLongitude = -98.900000
        
        for i in 1...numParkingLots {
            let latitude = Double.random(in: minLatitude...maxLatitude)
            let longitude = Double.random(in: minLongitude...maxLongitude)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let name = "Parking Lot \(i)"
            let address = "Address \(i)"
            
            let parkingLot = ParkingLot(name: name, address: address, coordinate: coordinate)
            parkingLots.append(parkingLot)
        }
        
        parkingLots.sort { $0.coordinate.latitude < $1.coordinate.latitude }
    }
    
}



struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView()
    }
}

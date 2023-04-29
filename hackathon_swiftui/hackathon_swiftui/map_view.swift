//
//  map_view.swift
//  hackathon_swiftui
//
//  Created by Sebastian Jacome on 29/04/23.
//

import SwiftUI
import MapKit


struct ParkingLot: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}



struct ParkingLotDetailView: View {
    
    let parkingLot: ParkingLot
    let onRequestParkingSpot: (ParkingLot) -> Void
    
    var body: some View {
        VStack {
            Text(parkingLot.name).font(.title)
            Text(parkingLot.address).font(.subheadline).foregroundColor(.gray)
            Button(action: { onRequestParkingSpot(parkingLot) }) {
                Text("Solicitar lugar de estacionamiento")
            }.padding()
        }
    }
    
}

struct ReviewFormView: View {
    
    @Binding var rating: Int
    @Binding var comment: String
    
    var body: some View {
        VStack {
            Text("Califica este estacionamiento").font(.title)
            Spacer()
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < rating ? "star.fill" : "star")
                        .foregroundColor(index < rating ? .yellow : .gray)
                        .onTapGesture {
                            rating = index + 1
                        }
                }
            }
            Spacer()
            TextEditor(text: $comment)
                .frame(height: 100)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            Spacer()
        }
    }
}
    
    struct ParkingLotDetailViewWithReview: View {let parkingLot: ParkingLot
        let onRequestParkingSpot: (ParkingLot) -> Void
        @State var showReviewForm = false
        @State var rating = 0
        @State var comment = ""
        
        var body: some View {
            VStack {
                ParkingLotDetailView(parkingLot: parkingLot, onRequestParkingSpot: onRequestParkingSpot)
                Button(action: { showReviewForm.toggle() }) {
                    Text("Escribir reseña")
                }.padding()
                if showReviewForm {
                    ReviewFormView(rating: $rating, comment: $comment)
                    Button(action: { showReviewForm.toggle() }) {
                        Text("Enviar")
                    }.padding()
                }
            }
        }
    }

struct MapView: UIViewRepresentable {
    
    let mapView = MKMapView()
    let parkingLots: [ParkingLot]
    @Binding var selectedParkingLot: ParkingLot?
    let onRequestParkingSpot: (ParkingLot) -> Void
    var region: MKCoordinateRegion
    
    
    func makeUIView(context: Context) -> MKMapView {
        // Set initial location to Mexico City
        let initialLocation = CLLocation(latitude: 19.4326, longitude: -99.1332)
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegion(
            center: initialLocation.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // Add map annotations for nearby parking lots
        addAnnotationsForNearbyParkingLots()
        
        // Set the delegate to handle map annotation clicks
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Do nothing
        uiView.setRegion(region, animated: true)
    }
    
    private func addAnnotationsForNearbyParkingLots() {
        // Create map annotations for each parking lot
        for parkingLot in parkingLots {
            let annotation = MKPointAnnotation()
            annotation.coordinate = parkingLot.coordinate
            annotation.title = parkingLot.name
            annotation.subtitle = parkingLot.address
            mapView.addAnnotation(annotation)
        }
    }
    
    // Coordinator class to handle map annotation clicks
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation {
                // Find the parking lot corresponding to the selected annotation
                if let parkingLot = parent.parkingLots.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }) {
                    parent.selectedParkingLot = parkingLot
                }
            }
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView){
                parent.region = mapView.region
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
}


struct MapViewWithResetButton: View {
    
    let parkingLots = [
        ParkingLot(name: "Parking Lot 1", address: "Address 1", coordinate: CLLocationCoordinate2D(latitude: 19.431952, longitude: -99.133254)),
        ParkingLot(name: "Parking Lot 2", address: "Address 2", coordinate: CLLocationCoordinate2D(latitude: 19.429749, longitude: -99.136491)),
        ParkingLot(name: "Parking Lot 3", address: "Address 3", coordinate: CLLocationCoordinate2D(latitude: 19.435408, longitude: -99.142398))
    ]
    @State var selectedParkingLot: ParkingLot?
    @State var region: MKCoordinateRegion
    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapView(parkingLots: parkingLots, selectedParkingLot: $selectedParkingLot, region:$region) { parkingLot in
                // Handle parking spot request
                print("Requested parking spot for \(parkingLot.name)")
            }.frame(height: 300)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                    })
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                    .padding()
                }
            }
        }
    }
}

struct map_view: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        MapViewWithResetButton(region: $region)
            .frame(height: 300)
            .padding()
    }
}


struct map_view_Previews: PreviewProvider {
    static var previews: some View {
        map_view()
    }
}

//
//  UIViewRepresentable.swift
//  Hackaton V02
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let mapView = MKMapView()
    let parkingLots: [ParkingLot]
    @Binding var selectedParkingLot: ParkingLot?
    let onRequestParkingSpot: (ParkingLot) -> Void
    let mexicoCityCoordinate = CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332)
    
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        // Set initial location to Mexico City
        let initialLocation = CLLocation(latitude: 19.4326, longitude: -99.1332)
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegion(
            center: initialLocation.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // Set the map center to Mexico City
        mapView.userTrackingMode = .none
        
        // Add map annotations for nearby parking lots
        for parkingLot in parkingLots {
            let annotation = MKPointAnnotation()
            annotation.coordinate = parkingLot.coordinate
            annotation.title = parkingLot.name
            annotation.subtitle = parkingLot.address
            mapView.addAnnotation(annotation)
            
                  
           
        }
        
        // Add a button to go to user location
        let button = MKUserTrackingButton(mapView: mapView)

        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -10),
            button.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -10),
        ])
        
        // Set the delegate to handle map annotation clicks
        mapView.delegate = context.coordinator
        
        return mapView
    }


    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if let parkingLot = selectedParkingLot,
            let annotation = mapView.annotations.first(where: { $0.coordinate.latitude == parkingLot.coordinate.latitude && $0.coordinate.longitude == parkingLot.coordinate.longitude }) as? MKPointAnnotation {
            let newAnnotation = MKPointAnnotation()
            newAnnotation.coordinate = annotation.coordinate
            newAnnotation.title = "New Title"
            newAnnotation.subtitle = annotation.subtitle
            mapView.removeAnnotation(annotation)
            mapView.addAnnotation(newAnnotation)
        }
        uiView.userTrackingMode = .follow
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
        
        let parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation {
                // Find the parking lot corresponding to the selected annotation
                if let parkingLot = parent.parkingLots.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude
                          
                }
                                                                   ) {
                  
                          
                    parent.selectedParkingLot = parkingLot
                }
            }
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    private func centerMapOnMexicoCity() {
            let regionRadius: CLLocationDistance = 50000
            let coordinateRegion = MKCoordinateRegion(
                center: mexicoCityCoordinate,
                latitudinalMeters: regionRadius,
                longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    
}

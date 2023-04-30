//
//  ParkModel.swift
//  Hackaton V02
//
//  Created by iOS Lab on 29/04/23.
//

import Foundation
import MapKit

struct ParkingLot: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

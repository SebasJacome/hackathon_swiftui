//
//  ParkingLotDetailViewWithReview.swift
//  Hackaton V02
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct ParkingLotDetailViewWithReview: View {let parkingLot: ParkingLot
    let onRequestParkingSpot: (ParkingLot) -> Void
    @State var showReviewForm = false
    @State var rating = 0
    @State var comment = ""
    
    var body: some View {
        VStack {
            ParkingLotDetailView(parkingLot: parkingLot, onRequestParkingSpot: onRequestParkingSpot)
            
            NavigationLink(destination: ReviewFormView(rating: $rating, comment: $comment), label: {
                Text("Escribir reseña").font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
            })
        }
    }
    
}

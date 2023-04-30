import SwiftUI

struct ReservationsView: View {
    @State var reservations: [Req] = []
    private var dataPersistance = DataPersistance()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Reservaciones")
                    .bold()
                    .font(.title)
                    .frame(alignment: .leading)
                
                if reservations.isEmpty {
                    Text("No tienes reservaciones disponibles")
                        .padding()
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List(reservations) { reservation in
                        Button(action: {
                            reservations.removeAll { $0.id == reservation.id }
                            
                        }, label: {
                            Text(reservation.nombre_estacionamiento)
                                .font(.title)
                            Text(reservation.fecha.formatted())
                                .font(.subheadline)
                        })
                    }
                    .listStyle(PlainListStyle())
                }
            }.onAppear{
                reservations = try! dataPersistance.loadReq()
            }
            .onDisappear{
                try! dataPersistance.saveReq(req: reservations)
            }
            .padding()
            
        }
    }
}



struct ReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsView()
    }
}

import SwiftUI

struct ViewConfirmation: View {
    var nombreUsuario: String
    var placasCoche: String
    var modeloCoche: String
    var formaPago: String
    var nombreEstacionamiento: String
    var dataPersistance = DataPersistance()
    @State var dataReq: [Req] = []
    @State var showConfirmationMessage = false
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .center){
                Text("¡Tu solicitud ha sido enviada!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
            }
            
            Text("Estos son los datos proporcionados:")
                .font(.title3)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Nombre de usuario:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(nombreUsuario)
                }
                HStack {
                    Text("Placas de coche:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(placasCoche)
                }
                HStack {
                    Text("Modelo de coche:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(modeloCoche)
                }
                HStack {
                    Text("Forma de pago:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(formaPago)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            
            Button(action: {
                showConfirmationMessage.toggle()
                dataReq.append(Req(id_usuario: 1, nombre_estacionamiento: nombreEstacionamiento, fecha: Date(), placasVehiculo: placasCoche, modeloVehiculo: modeloCoche, formaDePago: formaPago))
                try! dataPersistance.saveReq(req: dataReq)
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Aceptar")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
            })
            Spacer()
        }
        .padding()
        .navigationBarTitle("Confirmación")
        .alert(isPresented: $showConfirmationMessage) {
            Alert(
                title: Text("Solicitud Enviada"),
                message: Text("Te esperamos"),
                dismissButton: .default(Text("Aceptar")) {
                    showConfirmationMessage.toggle()
                }
            )
        }
        .onAppear{
            dataReq = try! dataPersistance.loadReq()
        }
    }
    
}

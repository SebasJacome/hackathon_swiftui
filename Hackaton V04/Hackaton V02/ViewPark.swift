import SwiftUI

struct ViewPark: View {
    var dataPersistance = DataPersistance()
    @State private var nombreUsuario = ""
    @State private var placasCoche = ""
    @State private var modeloCoche = ""
    @State private var formaPago = ""
    @State var nombreEstacionamiento: String

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Datos personales").font(.headline)) {
                                        TextField("Nombre de usuario", text: $nombreUsuario)
                                    }
                                    Section(header: Text("Datos del vehículo").font(.headline)) {
                                        TextField("Placas de coche", text: $placasCoche)
                                        TextField("Modelo de coche", text: $modeloCoche)
                                    }
                Section(header: Text("Forma de pago").font(.headline)) {
                                        Picker(selection: $formaPago, label: Text("Selecciona una opción")) {
                                            Text("Efectivo").tag("Efectivo")
                                            Text("Tarjeta de crédito").tag("Tarjeta de crédito")
                                            Text("PayPal").tag("PayPal")
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                                    }
                                }
            Spacer()
            NavigationLink(destination: ViewConfirmation(nombreUsuario: nombreUsuario, placasCoche: placasCoche, modeloCoche: modeloCoche, formaPago: formaPago, nombreEstacionamiento: nombreEstacionamiento)) {
                Text("Confirmar solicitud")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color.gray)
                                        .cornerRadius(15)
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 30)
            }
        }
        .navigationBarTitle("Solicitud")
    }
}


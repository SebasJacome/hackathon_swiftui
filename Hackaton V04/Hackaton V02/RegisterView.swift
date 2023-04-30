//
//  RegisterView.swift
//  Hackaton2
//
//  Created by Sebastian Jacome on 29/04/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var mensaje = ""

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 80))
                .foregroundColor(.black)

            TextField("Nombre", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)


            
            TextField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)

            TextField("Confirm password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)
            

            Button("Register") {
                
                //registrarUsuario()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
        .padding(.horizontal)
        .navigationTitle("Register")
    }

    func registrarUsuario() {
        guard let url = URL(string: "localhost:3000/usuarios/") else {
            fatalError("URL inválida")
        }

        guard password == confirmPassword else {
            mensaje = "Las contraseñas no coinciden"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let datos = ["correo": email, "contrasena": password]
        guard let cuerpo = try? JSONSerialization.data(withJSONObject: datos, options: []) else {
            fatalError("Error al serializar datos")
        }
        request.httpBody = cuerpo

        URLSession.shared.dataTask(with: request) { datos, respuesta, error in
            guard let datos = datos else {
                self.mensaje = "Error al recibir respuesta: \(error?.localizedDescription ?? "desconocido")"
                return
            }
            let respuesta = String(data: datos, encoding: .utf8) ?? ""
            if respuesta == "OK" {
                self.mensaje = "Registro exitoso"
            } else {
                self.mensaje = "Error al registrar usuario"
            }
        }.resume()
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

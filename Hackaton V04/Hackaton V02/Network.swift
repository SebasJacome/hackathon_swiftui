import SwiftUI

struct User: Identifiable, Codable{
    enum CodingKeys: CodingKey{
        case id_usuario
        case nombre
        case correo
        case contrasena
    }
    var id = UUID()
    var id_usuario: Int
    var nombre: String
    var correo: String
    var contrasena: String
}

class network: ObservableObject{
    @Published var users = [User]()
    @Published var correo = ""
    
    func getUsers(correo: String, password: String) -> Void{
        let url_req = "http://localhost:3000/usuarios/" + correo + "/" + password
        print(url_req)
        guard let url = URL(string: url_req) else{
            return 
//            fatalError("Missing URL")
        }
        let urlrequest = URLRequest(url:url)
        let dataTask = URLSession.shared.dataTask(with: urlrequest){
            (data, response, error) in
            if let error = error{
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else{
                return
            }
            if response.statusCode == 200{
                guard let data = data else
                {
                    return
                }
                DispatchQueue.main.async {
                    do{
                        let decodedusers = try JSONDecoder().decode([User].self, from: data)
                        let arrayusers = Array(decodedusers)
                        self.users = arrayusers
                        self.correo = self.users[0].correo
                        print(self.correo)
                    }
                    catch let error{
                        print("Error decoding", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

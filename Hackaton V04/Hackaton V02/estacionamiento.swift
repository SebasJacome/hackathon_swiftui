import SwiftUI

struct Park: Identifiable, Codable{
    enum CodingKeys: CodingKey{
        case id_estacionamiento
        case nombre
        case direccion
        case cLatitud
        case cLongitud
    }
    var id = UUID()
    var id_estacionamiento: Int
    var nombre: String
    var direccion: String
    var cLatitud: String
    var cLongitud: String
}

class parking: ObservableObject{
    @Published var parks = [Park]()
    
    init(){
        getParks()
    }
    
    
    
    func getParks() -> Void{
        guard let url = URL(string: "http://localhost:3000/estacionamientos") else{
            fatalError("Missing URL")
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
                        let decodedusers = try JSONDecoder().decode([Park].self, from: data)
                        let arrayparks = Array(decodedusers)
                        self.parks = arrayparks
                        print(self.parks[0].cLatitud)
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

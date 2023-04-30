import SwiftUI

struct Rtng: Identifiable, Codable{
    enum CodingKeys: CodingKey{
        case id_resena
        case id_estacionamiento
        case calificacion
        case comentario
        
    }
    var id = UUID()
    var id_resena: Int
    var id_estacionamiento: Int
    var calificacion: Int
    var comentario: String
    
}

class Ratings: ObservableObject{
    @Published var ratings = [Rtng]()
    
    init(){
        getRatings()
    }
    
    
    
    func getRatings() -> Void{
        // Corregir ruta
        guard let url = URL(string: "http://localhost:3000/resenas/") else{
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
                        let decodedusers = try JSONDecoder().decode([Rtng].self, from: data)
                        let arrayRatings = Array(decodedusers)
                        self.ratings = arrayRatings
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

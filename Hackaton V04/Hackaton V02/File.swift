import SwiftUI

struct Req: Identifiable, Codable{
    enum CodingKeys: CodingKey{
        case id_usuario
        case nombre_estacionamiento
        case fecha
        case placasVehiculo
        case modeloVehiculo
        case formaDePago
        
    }
    var id = UUID()
    var id_usuario: Int
    var nombre_estacionamiento: String
    var fecha: Date
    var placasVehiculo: String
    var modeloVehiculo: String
    var formaDePago: String
    
}

class DataPersistance {
    private let fileManager = FileManager.default
    private let documentDirectory: URL
    private let reqURL: URL
    
    init() {
        self.documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.reqURL = documentDirectory.appendingPathComponent("request").appendingPathExtension("json")
        print("im here innit")
    }
    
    func saveReq(req: [Req]) throws {
        print("im here save")
        let encoder = JSONEncoder()
        let encodedItems = try encoder.encode(req)
        try encodedItems.write(to: reqURL)
        
    }
    
    func loadReq() throws -> [Req] {
        print("im here load")
        guard fileManager.fileExists(atPath: reqURL.path) else {
            return []
            
        }
        let  decoder = JSONDecoder()
        let decodedItems = try decoder.decode([Req].self, from: Data(contentsOf: reqURL))
        
        return decodedItems
    }
}


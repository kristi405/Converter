import Foundation

class NetworkManeger {
    
    static let shered = NetworkManeger()
    
    private init() {}
    
    func getRate(completion: @escaping ([Rate]) -> ()) {
        let url = URL(string: "https://www.nbrb.by/api/exrates/rates?periodicity=0")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            let decoder = JSONDecoder()
            do {
            let rates = try decoder.decode([Rate].self, from: data)
                completion(rates)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}

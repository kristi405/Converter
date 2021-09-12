import Foundation

class NetworkManeger {
    
    static let shared = NetworkManeger()
    
    private init() {}
    
    func getRate(date: String, completion: @escaping ([Rate]) -> ()) {
        let url = URL(string: getURL(date: date))
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            self.parseJSON(data: data) { rate in
                completion(rate)
            }
        }
        task.resume()
    }
    
    private func parseJSON(data: Data, completion: @escaping ([Rate]) -> ()) {
        let decoder = JSONDecoder()
        do {
        let rates = try decoder.decode([Rate].self, from: data)
            completion(rates)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func getURL(date: String) -> String {
        GlobalConstants.baseURL + GlobalConstants.path + "periodicity=0&ondate=\(date)"
    }
}

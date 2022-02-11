import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        
        let key = "7d2ce4c660d26aaf2122fccf890f187b"
        let latitude = 59.933880
        let longitude = 30.337239
        
        let urlString = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}

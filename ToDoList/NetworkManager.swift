import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchTodos(completion: @escaping (Result<TodoResponse, Error>) -> Void) {
        let urlString = "https://dummyjson.com/todos"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TodoResponse.self, from: data)
                
                completion(.success(result))
                
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}

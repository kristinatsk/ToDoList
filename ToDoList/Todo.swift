import Foundation

struct TodoResponse: Decodable {
    let todos: [Todo]
    let total: Int
    let skip: Int
    let limit: Int
}
struct Todo: Codable {
    let id: Int
    var todo: String
    var completed: Bool
    var todoDescription: String?
    var createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case todo
        case completed
    }
}

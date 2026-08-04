import UIKit

final class TodoListInteractor: TodoListInteractorProtocol {
    weak var presenter: TodoListInteractorOutputProtocol?
    
    
    func fetchTodos() {
        let todos = CoreDataManager.shared.fetchTodos()
        presenter?.didFetchTodos(todos)
    }
}

import Foundation

final class TodoListPresenter: TodoListPresenterProtocol, TodoListInteractorOutputProtocol {
    
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorProtocol?
    var router: TodoListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchTodos()
    }
    
    func didFetchTodos(_ todos: [ToDoEntity]) {
        view?.updateScreen(with: todos)
    }
    
}

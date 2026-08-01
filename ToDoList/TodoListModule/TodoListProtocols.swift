import UIKit

protocol TodoListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol TodoListViewProtocol: AnyObject {
    func updateScreen(with todos: [ToDoEntity])
}

protocol TodoListInteractorProtocol: AnyObject {
    func fetchTodos()
}

protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchTodos(_ todos: [ToDoEntity])
}

protocol TodoListRouterProtocol: AnyObject {
    static func getModule() -> UIViewController
}

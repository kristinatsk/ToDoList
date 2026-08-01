import UIKit

final class TodoListViewController: UIViewController, TodoListViewProtocol {

    
    var presenter: TodoListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoad()
        
        
    }
    
    func updateScreen(with todos: [ToDoEntity]) {
        
    }
    
}

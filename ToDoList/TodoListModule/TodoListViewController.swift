import UIKit

final class TodoListViewController: UIViewController, TodoListViewProtocol {

    
    var presenter: TodoListPresenterProtocol?
    private let tableView = UITableView()
    private var todos: [ToDoEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }
    
    func updateScreen(with todos: [ToDoEntity]) {
        self.todos = todos
        tableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        let todo = todos[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = todo.title
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

extension TodoListViewController: UITableViewDelegate {
    
}

import UIKit

final class TodoListRouter: TodoListRouterProtocol {
    weak var view: UIViewController?
    
    static func getModule() -> UIViewController {
        let view = TodoListViewController()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    //TODO: finish with AddTaskModule
    func routeToAddTask() {
        <#code#>
    }
}

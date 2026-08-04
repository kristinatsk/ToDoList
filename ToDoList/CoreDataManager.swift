import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ToDoList")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Не удалось загрузить CoreData:   ")
            }
        }
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func save(todos: [Todo]) {
        let context = persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        context.perform {
            for todo in todos {
                let entity = ToDoEntity(context: context)
                
                entity.id = Int64(todo.id)
                entity.title = todo.todo
                entity.completed = todo.completed
                entity.createdAt = todo.createdAt ?? Date()
                entity.todoDescription = todo.todoDescription ?? "Нет описания"
            }
            do {
                try context.save()
                print("Задачи успешно сохранены в фоне")
            } catch {
                print("Ошибка сохранения")
            }
        }
    }
    
    func fetchTodos() -> [ToDoEntity] {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        
        do {
            let savedTodos = try persistentContainer.viewContext.fetch(request)
            return savedTodos
        } catch {
            print("Ошибка при получении задач: \(error)")
            return []
        }
    }
}

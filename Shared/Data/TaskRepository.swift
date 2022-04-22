//
//  TaskRepository.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 21/04/22.
//

import Foundation

protocol TaskRepository {
    func getTasks() -> [Task]
    func getTask(id: String) -> Task?
    func addTask(task: Task)
    func removeTask(task: Task)
    func updateTask(task: Task)
}

class TaskRepositoryImpl: TaskRepository {
    
    private var tasks = [Task]()

    init() {
        addTask(task: Task(id: "123", title: "Watch Avengers", isCompleted: false))
        addTask(task: Task(id: "345", title: "Go to LA", isCompleted: true))
        addTask(task: Task(id: "456", title: "Decide if tests are worth it", isCompleted: false))
    }

    func getTasks() -> [Task] {
        return tasks
    }
    
    func getTask(id: String) -> Task? {
        return tasks.first(where: { $0.id == id})
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(task: Task) {
        tasks.removeAll(where: { $0.id == task.id })
    }
    
    func updateTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task
        }
    }
}

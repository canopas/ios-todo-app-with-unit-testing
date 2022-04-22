//
//  TaskListVMTest.swift
//  TodoAppTests
//
//  Created by Jimmy S on 22/04/22.
//

import XCTest
@testable import TodoApp

class TaskListVMTest: XCTestCase {
    
    var viewModel: TaskListVM!
    var taskRepository: TaskRepository!

    override func setUpWithError() throws {        
        viewModel = TaskListVM()
        taskRepository = Injector.assembler.resolver.resolve(TaskRepository.self)!
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadsTasks_OnInit() {
        XCTAssertEqual(taskRepository.getTasks(), viewModel.tasks)
    }
    
    func testUpdateTask_OnToggleComplete() {
        let task = taskRepository.getTasks().first!
        
        viewModel.toogleComplete(task: task)
        
        let updatedTask = taskRepository.getTask(id: task.id)!
        
        XCTAssertEqual(task.isCompleted, !updatedTask.isCompleted)
    }
}

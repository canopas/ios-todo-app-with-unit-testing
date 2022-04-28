//
//  TaskListVMTest.swift
//  TodoAppTests
//
//  Created by Jimmy S on 22/04/22.
//

import XCTest
import UIPilot
@testable import TodoApp

class TaskListVMTest: XCTestCase {
    
    var viewModel: TaskListVM!
    var taskRepository: TaskRepository!
    var uipilot: UIPilot<AppRoute>!

    override func setUpWithError() throws {        
        viewModel = TaskListVM()
        taskRepository = Injector.assembler.resolver.resolve(TaskRepository.self)!
        uipilot = Injector.assembler.resolver.resolve(UIPilot<AppRoute>.self)!
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadsTasks_OnRefresh() {
        XCTAssertEqual([], viewModel.tasks)
        viewModel.refreshTasks()
        XCTAssertEqual(taskRepository.getTasks(), viewModel.tasks)
    }
    
    func testUpdateTask_OnToggleComplete() {
        let task = taskRepository.getTasks().first!
        
        viewModel.toogleComplete(task: task)
        
        let updatedTask = taskRepository.getTask(id: task.id)!
        
        XCTAssertEqual(task.isCompleted, !updatedTask.isCompleted)
    }
    
    func testPushAddRoute_OnAddClick() {
        XCTAssertEqual(AppRoute.List, uipilot.stack.last)
        viewModel.onAdd()
        XCTAssertEqual(AppRoute.Add, uipilot.stack.last)
    }

}

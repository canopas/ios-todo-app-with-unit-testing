//
//  AddTaskVMTest.swift
//  TodoAppTests
//
//  Created by Jimmy S on 28/04/22.
//

import XCTest
import UIPilot
@testable import TodoApp

class AddTaskVMTest: XCTestCase {

    var viewModel: AddTaskVM!
    var taskRepository: TaskRepository!
    var uipilot: UIPilot<AppRoute>!

    override func setUpWithError() throws {
        viewModel = AddTaskVM()
        taskRepository = Injector.assembler.resolver.resolve(TaskRepository.self)!
        uipilot = Injector.assembler.resolver.resolve(UIPilot<AppRoute>.self)!
        uipilot.push(.Add)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddTask_OnSaveClick() {
        viewModel.title = "I'm new task"
        viewModel.onSave()
        
        let task = taskRepository.getTasks().last!
                        
        XCTAssertEqual("I'm new task", task.title)
        XCTAssertFalse(task.isCompleted)
    }
    
    func testPopRoute_OnSaveClick() {
        XCTAssertEqual(AppRoute.Add, uipilot.stack.last)
        viewModel.onSave()
        XCTAssertEqual(AppRoute.List, uipilot.stack.last)
    }
}

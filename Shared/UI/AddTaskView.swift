//
//  AddTaskView.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 28/04/22.
//

import SwiftUI
import UIPilot

struct AddTaskView: View {
    
    @StateObject var viewModel = AddTaskVM()
    
    var body: some View {
        VStack {
            TextField("What's on your mind?", text: $viewModel.title)
                .padding()
            HStack {
                Button("Save", action: {
                    viewModel.onSave()
                })
                Spacer()
            }.padding()
            Spacer()
        }
        .background(Color.orange)
        .navigationTitle("Add task")
    }
}


class AddTaskVM: ObservableObject {
    
    private let taskRepository: TaskRepository
    private let pilot: UIPilot<AppRoute>

    @Published var title: String = ""
        
    init() {
        taskRepository = Injector.assembler.resolver.resolve(TaskRepository.self)!
        pilot = Injector.assembler.resolver.resolve(UIPilot<AppRoute>.self)!
    }
        
    func onSave() {
        let newTask = Task(id: UUID().uuidString, title: title, isCompleted: false)
        taskRepository.addTask(task: newTask)
        pilot.pop()
    }
}


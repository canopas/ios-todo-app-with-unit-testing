//
//  TaskListView.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 21/04/22.
//

import Foundation
import SwiftUI
import UIPilot

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListVM()
    
    var body: some View {
        List(viewModel.tasks) { (task: Task) in
            TaskItemView(isChecked: task.isCompleted, task: task, onToggleComplete: {
                viewModel.toogleComplete(task: task)
            })
        }
        .background(Color.yellow)
        .navigationTitle("Tasks")
        .navigationBarItems(trailing: Button("Add", action: {
            self.viewModel.onAdd()
        }))
        .onAppear {
            // Set the default to clear
            UITableView.appearance().backgroundColor = .clear
            self.viewModel.refreshTasks()
        }
    }
}

struct TaskItemView: View {
    
    @State var isChecked: Bool
    
    let task: Task
    let onToggleComplete: () -> Void
        
    var body: some View {
        HStack {
            Toggle(isOn: $isChecked) {
                Text(task.title).strikethrough(task.isCompleted)
            }
            .toggleStyle(CheckboxStyle())
            .onChange(of: isChecked) { newValue in
                onToggleComplete()
            }
        }.padding()
    }
}


struct CheckboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}


class TaskListVM: ObservableObject {
    
    private let taskRepository: TaskRepository
    private let pilot: UIPilot<AppRoute>

    @Published
    var tasks = [Task]()
    
    init() {
        taskRepository = Injector.assembler.resolver.resolve(TaskRepository.self)!
        pilot = Injector.assembler.resolver.resolve(UIPilot<AppRoute>.self)!
    }
    
    func toogleComplete(task: Task) {
        let newTask = Task(id: task.id, title: task.title, isCompleted: !task.isCompleted)
        taskRepository.updateTask(task: newTask)
        refreshTasks()
    }
    
    func refreshTasks() {
        tasks = taskRepository.getTasks()
    }
    
    func onAdd() {
        pilot.push(.Add)
    }
}


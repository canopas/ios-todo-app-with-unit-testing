//
//  ContentView.swift
//  Shared
//
//  Created by Jimmy S on 21/04/22.
//

import SwiftUI
import UIPilot

enum AppRoute: Equatable {
    case List
    case Add
    case View(task: Task)
}

struct ContentView: View {
    
    private let pilot: UIPilot<AppRoute>
    
    init() {
        pilot = Injector.assembler.resolver.resolve(UIPilot<AppRoute>.self)!
    }
        
    var body: some View {
        UIPilotHost(pilot) { route in
            switch route {
                case .List: return AnyView(TaskListView())
                case .View: return AnyView(EmptyView())
                case .Add: return AnyView(AddTaskView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

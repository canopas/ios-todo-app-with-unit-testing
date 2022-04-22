//
//  DataModule.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 22/04/22.
//

import Foundation
import Swinject

class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TaskRepository.self) { _ in
            return TaskRepositoryImpl()
        }.inObjectScope(.container)
    }
}

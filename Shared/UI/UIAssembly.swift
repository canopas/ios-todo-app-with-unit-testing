//
//  UIAssembly.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 28/04/22.
//

import Foundation
import Swinject
import UIPilot

class UIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIPilot<AppRoute>.self) { _ in
            return UIPilot(initial: AppRoute.List)
        }.inObjectScope(.container)
    }
}

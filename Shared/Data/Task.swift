//
//  Task.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 21/04/22.
//

import Foundation

struct Task: Equatable, Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

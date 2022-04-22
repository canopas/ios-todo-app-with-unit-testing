//
//  Injector.swift
//  TodoApp (iOS)
//
//  Created by Jimmy S on 22/04/22.
//

import Foundation
import Swinject

class Injector {
    
    private(set) static var assembler: Assembler!
    
    static func initGraph(_ assemblies: [Assembly]) {
        Injector.assembler = Assembler(assemblies)
    }
}

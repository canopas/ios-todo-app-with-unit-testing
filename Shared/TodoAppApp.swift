//
//  TodoAppApp.swift
//  Shared
//
//  Created by Jimmy S on 21/04/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    init() {
        Injector.initGraph([DataAssembly(), UIAssembly()])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

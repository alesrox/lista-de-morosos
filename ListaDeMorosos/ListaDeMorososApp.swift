//
//  ListaDeMorososApp.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI
import SwiftData

@main
struct ListaDeMorososApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Moroso.self)
    }
}

//
//  SwiftData_OptionalsApp.swift
//  SwiftData-Optionals
//
//  Created by Remo Prozzillo on 27.05.2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_OptionalsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

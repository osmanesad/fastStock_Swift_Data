//
//  Stok_TakipApp.swift
//  Stok_Takip
//
//  Created by Osman Esad on 25.08.2024.
//

import SwiftUI
import SwiftData


@main
struct Stok_TakipApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            StokItem.self,
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
        .modelContainer(for: StokItem.self)
    }
}

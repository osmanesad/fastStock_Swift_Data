import SwiftUI
import SwiftData

@main
struct StokYonetimApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: StokItem.self)
    }
}

import AppKit
import SwiftUI

@main
struct PharmonitorAdminApp: App {
    @StateObject private var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup("Surveyors") {
            SurveyorsView()
                .environmentObject(settingsStore)
        }
        .defaultSize(width: 720, height: 480)

        WindowGroup("Jobs", id: "jobs") {
            JobsView()
                .environmentObject(settingsStore)
        }
        .defaultSize(width: 640, height: 420)

        WindowGroup("Settings", id: "settings") {
            SettingsView()
                .environmentObject(settingsStore)
        }
        .defaultSize(width: 520, height: 360)

        .commands {
            PharmonitorCommands()
        }
    }
}

struct PharmonitorCommands: Commands {
    @Environment(\.openWindow) private var openWindow

    var body: some Commands {
        CommandMenu("Pharmonitor") {
            Button("Surveyors") {
                NSApp.activate(ignoringOtherApps: true)
                NSApp.windows.first { $0.isVisible }?.makeKeyAndOrderFront(nil)
            }
            .keyboardShortcut("1")

            Button("Jobs") {
                openWindow(id: "jobs")
            }
            .keyboardShortcut("2")

            Divider()

            Button("Settings") {
                openWindow(id: "settings")
            }
            .keyboardShortcut(",")
        }
    }
}

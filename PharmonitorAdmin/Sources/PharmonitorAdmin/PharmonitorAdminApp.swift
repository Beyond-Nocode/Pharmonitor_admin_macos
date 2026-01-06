import SwiftUI

@main
struct PharmonitorAdminApp: App {
    @StateObject private var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup("Surveyors", id: "surveyors") {
            SurveyorsView()
                .environmentObject(settingsStore)
        }
        .defaultSize(width: 720, height: 480)

        WindowGroup("Jobs", id: "jobs") {
            JobsView()
                .environmentObject(settingsStore)
        }
        .defaultSize(width: 640, height: 420)

        Settings {
            SettingsView()
                .environmentObject(settingsStore)
        }

        .commands {
            PharmonitorCommands()
        }
    }
}

struct PharmonitorCommands: Commands {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.openSettings) private var openSettings

    var body: some Commands {
        CommandMenu("Pharmonitor") {
            Button("Surveyors") {
                openWindow(id: "surveyors")
            }
            .keyboardShortcut("1")

            Button("Jobs") {
                openWindow(id: "jobs")
            }
            .keyboardShortcut("2")

            Divider()

            Button("Settings") {
                openSettings()
            }
            .keyboardShortcut(",")
        }
    }
}

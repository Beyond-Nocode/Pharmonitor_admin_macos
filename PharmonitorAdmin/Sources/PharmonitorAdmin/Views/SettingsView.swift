import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settingsStore: SettingsStore

    var body: some View {
        Form {
            Section("API Configuration") {
                TextField("WhatsApp API Key", text: $settingsStore.whatsAppApiKey)
                    .textFieldStyle(.roundedBorder)
                Text("Used to authenticate requests to the WhatsApp gateway.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Section("PostgreSQL Connection") {
                TextField("Host", text: $settingsStore.postgresHost)
                TextField("Port", text: $settingsStore.postgresPort)
                TextField("Database", text: $settingsStore.postgresDatabase)
                TextField("User", text: $settingsStore.postgresUser)
                SecureField("Password", text: $settingsStore.postgresPassword)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

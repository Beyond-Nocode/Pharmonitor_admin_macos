import SwiftUI

struct SurveyorsView: View {
    @EnvironmentObject private var settingsStore: SettingsStore
    @State private var sessions: [String] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            content
            Spacer()
        }
        .padding(24)
    }

    private var header: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading) {
                Text("WhatsApp Sessions")
                    .font(.title2)
                    .bold()
                Text("Monitor active gateway sessions from the remote API.")
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: {
                Task { await refreshSessions() }
            }) {
                if isLoading {
                    ProgressView()
                        .controlSize(.small)
                } else {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
            .buttonStyle(.bordered)
            .disabled(isLoading)
        }
    }

    private var content: some View {
        Group {
            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            } else if sessions.isEmpty {
                Text("No sessions loaded yet. Select Refresh to query the gateway.")
                    .foregroundStyle(.secondary)
            } else {
                List(sessions, id: \.self) { session in
                    HStack {
                        Image(systemName: "message.fill")
                            .foregroundStyle(.green)
                        Text(session)
                    }
                }
                .listStyle(.inset)
            }
        }
    }

    @MainActor
    private func refreshSessions() async {
        isLoading = true
        errorMessage = nil
        let client = WhatsAppGatewayClient(apiKey: settingsStore.whatsAppApiKey)
        do {
            sessions = try await client.fetchSessions()
        } catch {
            errorMessage = "Unable to load sessions: \(error.localizedDescription)"
            sessions = []
        }
        isLoading = false
    }
}

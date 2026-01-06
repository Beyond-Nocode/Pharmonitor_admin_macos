import Foundation

final class SettingsStore: ObservableObject {
    @Published var whatsAppApiKey: String {
        didSet { store.set(whatsAppApiKey, forKey: Keys.whatsAppApiKey) }
    }

    @Published var postgresHost: String {
        didSet { store.set(postgresHost, forKey: Keys.postgresHost) }
    }

    @Published var postgresPort: String {
        didSet { store.set(postgresPort, forKey: Keys.postgresPort) }
    }

    @Published var postgresDatabase: String {
        didSet { store.set(postgresDatabase, forKey: Keys.postgresDatabase) }
    }

    @Published var postgresUser: String {
        didSet { store.set(postgresUser, forKey: Keys.postgresUser) }
    }

    @Published var postgresPassword: String {
        didSet { store.set(postgresPassword, forKey: Keys.postgresPassword) }
    }

    private let store: UserDefaults

    init(store: UserDefaults = .standard) {
        self.store = store
        self.whatsAppApiKey = store.string(forKey: Keys.whatsAppApiKey) ?? ""
        self.postgresHost = store.string(forKey: Keys.postgresHost) ?? ""
        self.postgresPort = store.string(forKey: Keys.postgresPort) ?? "5432"
        self.postgresDatabase = store.string(forKey: Keys.postgresDatabase) ?? ""
        self.postgresUser = store.string(forKey: Keys.postgresUser) ?? ""
        self.postgresPassword = store.string(forKey: Keys.postgresPassword) ?? ""
    }
}

private enum Keys {
    static let whatsAppApiKey = "settings.whatsapp.apiKey"
    static let postgresHost = "settings.postgres.host"
    static let postgresPort = "settings.postgres.port"
    static let postgresDatabase = "settings.postgres.database"
    static let postgresUser = "settings.postgres.user"
    static let postgresPassword = "settings.postgres.password"
}

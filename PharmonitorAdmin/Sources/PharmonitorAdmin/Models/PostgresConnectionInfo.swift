import Foundation

struct PostgresConnectionInfo {
    let host: String
    let port: String
    let database: String
    let user: String
    let password: String

    var isConfigured: Bool {
        !host.isEmpty && !database.isEmpty && !user.isEmpty
    }

    var connectionSummary: String {
        guard isConfigured else { return "Incomplete configuration" }
        let safePort = port.isEmpty ? "5432" : port
        return "\(user)@\(host):\(safePort)/\(database)"
    }
}

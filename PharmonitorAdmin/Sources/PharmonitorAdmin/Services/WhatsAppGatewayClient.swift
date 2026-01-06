import Foundation

struct WhatsAppGatewayClient {
    struct SessionResponse: Decodable {
        let data: [String]
    }

    let baseURL: URL
    let apiKey: String

    init(baseURL: URL = URL(string: "http://144.91.106.114:5001")!, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    func fetchSessions() async throws -> [String] {
        let url = baseURL.appendingPathComponent("session")
        var request = URLRequest(url: url)
        if !apiKey.isEmpty {
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(SessionResponse.self, from: data)
        return decoded.data
    }
}

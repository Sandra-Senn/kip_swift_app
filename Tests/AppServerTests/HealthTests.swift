import Testing
import VaporTesting

@testable import AppServer

@Suite("Health endpoint")
struct HealthTests {
    @Test("GET /health returns 200 OK")
    func healthReturnsOK() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "health") { res async in
                #expect(res.status == .ok)
            }
        }
    }
}

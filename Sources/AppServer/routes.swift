import Vapor

/// Registers all HTTP routes.
func routes(_ app: Application) throws {
    // Liveness probe: no auth, no body, reveals nothing about the system.
    app.get("health") { _ -> HTTPStatus in
        .ok
    }
}

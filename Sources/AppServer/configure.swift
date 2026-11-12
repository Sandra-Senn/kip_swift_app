import Vapor

/// Configures the application: middleware, database and routes.
public func configure(_ app: Application) async throws {
    try routes(app)
}

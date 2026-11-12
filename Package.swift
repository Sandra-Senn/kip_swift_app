// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Unhinged",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.115.0")
    ],
    targets: [
        // Pure Swift, no dependencies: projection, km grid, noise, region query.
        .target(name: "RegionCore"),

        // Text normalisation and restricted-term matching.
        .target(name: "ContentFilter"),

        // Vapor application: routes, auth, authorization, persistence.
        .target(
            name: "AppServer",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),

        // Thin executable that boots AppServer.
        .executableTarget(
            name: "Server",
            dependencies: [
                .target(name: "AppServer")
            ]
        ),

        .testTarget(
            name: "AppServerTests",
            dependencies: [
                .target(name: "AppServer"),
                .product(name: "VaporTesting", package: "vapor"),
            ]
        ),
    ]
)

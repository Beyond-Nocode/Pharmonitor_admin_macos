// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PharmonitorAdmin",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "PharmonitorAdmin", targets: ["PharmonitorAdmin"])
    ],
    targets: [
        .executableTarget(
            name: "PharmonitorAdmin",
            path: "Sources/PharmonitorAdmin"
        )
    ]
)

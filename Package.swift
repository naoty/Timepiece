// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Timepiece",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "Timepiece", targets: ["Timepiece"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Timepiece",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "TimepieceTests",
            dependencies: ["Timepiece"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)

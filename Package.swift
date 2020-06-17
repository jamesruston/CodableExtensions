// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "CodableExtensions",
    products: [
        .library(
            name: "CodableExtensions",
            targets: ["CodableExtensions"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CodableExtensions",
            dependencies: [],
            path: "Classes"),
        .testTarget(
            name: "CodableExtensionsTests",
            dependencies: ["CodableExtensions"]),
    ]
)

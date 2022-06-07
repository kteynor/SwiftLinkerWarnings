// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "ExampleLib",
    products: [
        .library(
            name: "ExampleLib",
            type: .dynamic,
            targets: ["Wrapper", "Implementation"]),
    ],
    targets: [
        .target(
            name: "Implementation",
            dependencies: []),
        .target(
            name: "Wrapper",
            dependencies: ["Implementation"]),
    ]
)

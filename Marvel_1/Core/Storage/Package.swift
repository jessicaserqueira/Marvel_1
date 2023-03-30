// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Storage",
            targets: ["Storage"]),
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../Core/Domain"
        ),
        .package(
            name: "AppData",
            path: "../Core/AppData"
        )
    ],
    targets: [
        .target(
            name: "Storage",
            dependencies: ["Domain", "AppData"]),
        .testTarget(
            name: "StorageTests",
            dependencies: ["Storage"]),
    ]
)

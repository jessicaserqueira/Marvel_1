// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DI",
            targets: ["DI"]),
    ],
    dependencies: [
        .package(
            name: "Common",
            path: "../Core/Common"
        ),
        .package(
            name: "Storage",
            path: "../Core/Storage"
        ),
        .package(
            name: "SDK",
            path: "../Core/SDK"
        ),
        .package(
            name: "Networking",
            path: "../Core/Networking"
        ),
        .package(
            name: "AppNavigation",
            path: "../Main/AppNavigation"
        ),
        .package(
            name: "Domain",
            path: "../Core/Domain"
        ),
        .package(
            name: "FireStorage",
            path: "../Core/FireStorage"
        )
    ],
    targets: [
        .target(
            name: "DI",
            dependencies: ["Common", "Storage", "Networking", "Domain","AppNavigation", "SDK", "FireStorage"]),
        .testTarget(
            name: "DITests",
            dependencies: ["DI"]),
    ]
)

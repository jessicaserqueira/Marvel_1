// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppNavigation",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppNavigation",
            targets: ["AppNavigation"]),
    ],
    dependencies: [
        .package(
            name: "Common",
            path: "../../Common"
        ),
        .package(
            name: "Comics",
            path: "../../Comics"
        ),
    ],
    targets: [
        .target(
            name: "AppNavigation",
            dependencies: ["Common", "Comics"]),
        .testTarget(
            name: "AppNavigationTests",
            dependencies: ["AppNavigation"]),
    ]
)

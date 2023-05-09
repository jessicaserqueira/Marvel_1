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
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.0"
        ),
        .package(
            url: "https://github.com/Swinject/SwinjectAutoregistration.git",
            from: "2.8.3"
        )
    ],
    targets: [
        .target(
            name: "AppNavigation",
            dependencies: ["Common", "Comics", "Swinject", "SwinjectAutoregistration"]),
        .testTarget(
            name: "AppNavigationTests",
            dependencies: ["AppNavigation"]),
    ]
)

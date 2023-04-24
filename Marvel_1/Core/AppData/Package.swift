// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppData",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppData",
            targets: ["AppData"]),
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../../Domain"
        ),
        .package(
            name: "Common",
            path: "../../Common"
        ),
    ],
    targets: [
        .target(
            name: "AppData",
            dependencies: ["Domain", "Common"]),
        .testTarget(
            name: "AppDataTests",
            dependencies: ["AppData"]),
    ]
)

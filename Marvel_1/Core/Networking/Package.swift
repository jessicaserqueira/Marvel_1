// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
    ],
    dependencies: [
        .package(
            name: "AppData",
            path: "../../AppData"
        ),
        .package(
            name: "Common",
            path: "../../Common"
        )
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["AppData", "Common"]),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]),
    ]
)


// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        .package(
            name: "Common",
            path: "../../Common"
        )
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: ["Common"]),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]),
    ]
)

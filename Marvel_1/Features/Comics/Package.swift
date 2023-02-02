// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Comics",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Comics",
            targets: ["Comics"]),
    ],
    dependencies: [
        .package(
            name: "Common",
            path: "../../Common"
        ),
        .package(
            name: "Domain",
            path: "../../Domain"
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher",
            from: "7.3.2"
        )
    ],
    targets: [
        
        .target(
            name: "Comics",
            dependencies: ["Common", "Domain", "Kingfisher"],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "ComicsTests",
            dependencies: ["Comics"]),
    ]
)

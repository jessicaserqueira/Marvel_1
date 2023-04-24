// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SDK",
            targets: ["SDK"]),
    ],
    dependencies: [
        .package(
            name: "AppData",
            path: "../../AppData"
        ),
        .package(
            name: "Common",
            path: "../../Common"
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher",
            from: "7.3.2"
        )
    ],
    targets: [

        .target(
            name: "SDK",
            dependencies: ["Kingfisher", "AppData", "Common"]),
        .testTarget(
            name: "SDKTests",
            dependencies: ["SDK"]),
    ]
)

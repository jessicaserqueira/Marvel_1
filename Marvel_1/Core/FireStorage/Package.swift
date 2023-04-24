// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FireStorage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FireStorage",
            targets: ["FireStorage"]),
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
        .package(url: "https://github.com/firebase/firebase-ios-sdk",
                 from: "9.6.0")
    ],
    targets: [
        .target(
            name: "FireStorage",
            dependencies: [
                "AppData",
                "Common",
                .product(
                    name: "FirebaseAnalytics",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseRemoteConfig",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebasePerformance",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseFirestore",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseFirestoreSwift",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseAuth",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseStorage",
                    package: "firebase-ios-sdk"
                )
            ]),
        .testTarget(
            name: "FireStorageTests",
            dependencies: ["FireStorage"]),
    ]
)

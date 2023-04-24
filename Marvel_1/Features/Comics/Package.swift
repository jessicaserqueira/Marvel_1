// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Comics",
    platforms: [.iOS(.v14)],
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
        ),
        .package(url: "https://github.com/firebase/firebase-ios-sdk",
                 from: "9.6.0")
    ],
    targets: [
        
        .target(
            name: "Comics",
            dependencies: ["Common", "Domain", "Kingfisher",
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
                           )
            ],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "ComicsTests",
            dependencies: ["Comics"]),
    ]
)

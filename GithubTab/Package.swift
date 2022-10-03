// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
// This package contains the Github tab from the initial monolith implementation

let package = Package(
    name: "GithubTab",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Search",
            targets: ["Search"]),
        .library(
            name: "Listing",
            targets: ["Listing"]),
        .library(name: "Details",
            targets: ["Details"]),
        .library(name: "UIComponents", targets: ["UIComponents"]),
        .library(name: "Utilities", targets: ["Utilities"])
    ],
    dependencies: [
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: ["Utilities"]),
        .target(
            name: "Listing",
            dependencies: [
                .product(name: "Resolver", package: "Resolver"),
                .product(name: "Rswift", package: "R.swift.Library"),
                "Search",
                "UIComponents",
                "Utilities"
            ],
            resources: [
                .process("Sources/Listing/Resources/**")
            ],
            plugins: [
                .plugin(name: "RswiftPlugin", package: "R.swift.Plugin")
            ]
        ),
        .target(
            name: "Details",
            dependencies: ["UIComponents", "Utilities"]
        ),
        .target(
            name: "UIComponents",
            dependencies: ["Utilities"]
        ),
        .target(name: "Utilities"),
        .testTarget(
            name: "SearchTests",
            dependencies: ["Search"]),
    ]
)

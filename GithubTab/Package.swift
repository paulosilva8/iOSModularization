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
        .library(name: "UIComponents", targets: ["UIComponents"])
    ],
    dependencies: [
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0")
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: []),
        .target(
            name: "Listing",
            dependencies: [
                .product(name: "Rswift", package: "R.swift.Library"),
                "Search",
                "UIComponents"
            ],
            plugins: [
                .plugin(name: "RswiftPlugin", package: "R.swift.Plugin")
            ]
        ),
        .target(name: "Details", dependencies: ["UIComponents"]),
        .target(name: "UIComponents"),
        .testTarget(
            name: "SearchTests",
            dependencies: ["Search"]),
    ]
)

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
    ],
    dependencies: [
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Search",
            dependencies: []),
        .target(
            name: "Listing",
            dependencies: [
                .product(name: "Rswift", package: "R.swift.Library")
            ],
            plugins: [
                .plugin(name: "RswiftPlugin", package: "R.swift.Plugin")
            ]
        ),
        .testTarget(
            name: "SearchTests",
            dependencies: ["Search"]),
    ]
)

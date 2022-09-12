// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MixObjcSwift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MixObjcSwift",
            targets: ["MixObjcSwift"]),
        .library(
            name: "CoreFramework",
            targets: ["CoreFramework"]),
        .library(
            name: "ObjectiveCPart",
            targets: ["ObjectiveCPart"]),
        .library(
            name: "SwiftPart",
            targets: ["SwiftPart"]),
        .library(name: "LabelObjectiveC", targets: ["LabelObjectiveC"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MixObjcSwift",
            dependencies: ["ObjectiveCPart"]),
        .target(name: "CoreFramework"),
        .target(name: "ObjectiveCPart", publicHeadersPath: "Public"),
        .target(name: "SwiftPart", dependencies: ["CoreFramework"]),
        .testTarget(
            name: "CoreFrameworkTests",
            dependencies: ["CoreFramework"]),
        .testTarget(
            name: "MixObjcSwiftTests",
            dependencies: ["MixObjcSwift", "ObjectiveCPart"]),
        .target(name: "LabelObjectiveC", dependencies: ["SwiftPart"], publicHeadersPath: "Public"),
        .testTarget(
            name: "ObjectiveCPartTests",
            dependencies: ["ObjectiveCPart", "SwiftPart"]),
        .testTarget(
            name: "SwiftPartTests",
            dependencies: ["SwiftPart"]),
    ]
)

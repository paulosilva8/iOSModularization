// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MixObjcSwift",
    products: [
        .library(
            name: "LabelSwift",
            targets: ["LabelSwift"]),
        .library(
            name: "CoreFramework",
            targets: ["CoreFramework"]),
        .library(
            name: "ObjectiveCComponent",
            targets: ["ObjectiveCComponent"]),
        .library(
            name: "SwiftComponent",
            targets: ["SwiftComponent"]),
        .library(name: "LabelObjectiveC", targets: ["LabelObjectiveC"])
    ],
    dependencies: [],
    targets: [
        // LabelSwift is the entrypoint of the module, from which the ViewControllerObjectiveC calls a Swift UILabel; it has a dependency on an Obj-C component
        .target(
            name: "LabelSwift",
            dependencies: ["ObjectiveCComponent"]),
        // LabelObjectiveC is the second entrypoint of the module, also called from ViewControllerObjectiveC; it has a dependency on a Swift component
        .target(name: "LabelObjectiveC", dependencies: ["SwiftComponent"], publicHeadersPath: "Public"),
        
        .target(name: "ObjectiveCComponent", publicHeadersPath: "Public"),
        .target(name: "SwiftComponent", dependencies: ["CoreFramework"]),
        .target(name: "CoreFramework"),
        .testTarget(
            name: "CoreFrameworkTests",
            dependencies: ["CoreFramework"]),
        .testTarget(
            name: "LabelSwiftTests",
            dependencies: ["LabelSwift", "ObjectiveCComponent"]),
        .testTarget(
            name: "ObjectiveCComponentTests",
            dependencies: ["ObjectiveCComponent", "SwiftComponent"]),
        .testTarget(
            name: "SwiftComponentTests",
            dependencies: ["SwiftComponent"]),
    ]
)

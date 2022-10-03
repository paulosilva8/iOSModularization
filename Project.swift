//
//  Project.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import ProjectDescription

let mySettings = Settings.settings(base: ["SWIFT_OBJC_BRIDGING_HEADER":"MixedLanugageExample/MixedLanugageExample/Sources/Headers/MixedLanugageExample-Bridging-Header.h"]
)

let project = Project(
    name: "ProjectFile",
    targets: [
        Target(
            name: "MixedLanugageExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.paulosilva8.modularizationPoC",
            infoPlist: "MixedLanugageExample/MixedLanugageExample/Info.plist",
            sources: ["MixedLanugageExample/MixedLanugageExample/Sources/**"],
            resources: ["MixedLanugageExample/MixedLanugageExample/Resources/**"],
            headers: Headers.headers(
                public: "MixedLanugageExample/MixedLanugageExample/Sources/Headers/**"
            ),
            dependencies: [
                .external(name: "Resolver"),
                .external(name: "CocoaLumberjack"),
                .external(name: "SDWebImage"),
                .external(name: "AppAuth"),
                .external(name: "Lottie"),
                .external(name: "Moya"),
                .external(name: "Kingfisher"),
                .external(name: "OHHTTPStubs"),
                .external(name: "OCHamcrest"),
                .external(name: "Rswift"),
                .external(name: "Details"),
                .external(name: "LabelObjectiveC"),
                .external(name: "Listing"),
                .external(name: "LabelSwift"),
                .external(name: "Search"),
                .external(name: "Utilities")
            ],
            settings: mySettings
        ),
        Target(
            name: "MixedLanugageUITests",
            platform: .iOS,
            product: .uiTests,
            bundleId: "com.gergelyorosz.MixedLanugageExampleUITests",
            infoPlist: "MixedLanugageExample/MixedLanugageExampleUITests/Info.plist",
            sources: ["MixedLanugageExample/MixedLanugageExampleUITests/**"],
            dependencies: [
                .target(name: "MixedLanugageExample")
            ]
        ),
        Target(
            name: "ShareAppExtension",
            platform: .iOS,
            product: .appExtension,
            bundleId: "com.paulosilva8.modularizationPoC.ShareAppExtension",
            infoPlist: "MixedLanugageExample/ShareAppExtension/Info.plist",
            sources: "MixedLanugageExample/ShareAppExtension/**",
            dependencies: []
        )
    ]
)

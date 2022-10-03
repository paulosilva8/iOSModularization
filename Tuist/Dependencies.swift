//
//  Dependencies.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 26/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/hmlongco/Resolver.git", requirement: .upToNextMajor(from: "1.5.0")),
        .remote(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", requirement: .upToNextMajor(from: "3.7.4")),
        .remote(url: "https://github.com/SDWebImage/SDWebImage.git", requirement: .upToNextMajor(from: "5.10.4")),
        .remote(url: "https://github.com/openid/AppAuth-iOS.git", requirement: .upToNextMajor(from: "1.5.0")),
        .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .upToNextMajor(from: "9.6.0")),
        .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .upToNextMajor(from: "3.4.3")),
        .remote(url: "https://github.com/Moya/Moya", requirement: .upToNextMajor(from: "15.0.0")),
        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.3.2")),
        .remote(url: "https://github.com/AliSoftware/OHHTTPStubs.git", requirement: .upToNextMajor(from: "9.1.0")),
        .remote(url: "https://github.com/hamcrest/OCHamcrest.git", requirement: .upToNextMajor(from: "9.0.1")),
        .remote(url: "https://github.com/mac-cain13/R.swift.Library", requirement: .branch("master")),
        .remote(url: "https://github.com/quentinfasquel/R.swift.Plugin", requirement: .upToNextMajor(from: "5.4.0")),
        .local(path: "GitHubTab"),
        .local(path: "MixObjcSwift")
    ],
    platforms: [.iOS]
)

// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.0"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.7.4"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.10.4"),
        .package(url: "https://github.com/openid/AppAuth-iOS.git", from: "1.5.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "9.6.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "3.4.3"),
        .package(url: "https://github.com/Moya/Moya", from: "15.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.3.2"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.1.0"),
        .package(url: "https://github.com/hamcrest/OCHamcrest.git", from: "9.0.1"),
        .package(url: "https://github.com/mac-cain13/R.swift.Library", branch: "master"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0"),
        .package(path: "/Users/SIP1OVR/Documents/GitHub/iOSModularization/GitHubTab"),
        .package(path: "/Users/SIP1OVR/Documents/GitHub/iOSModularization/MixObjcSwift"),
    ]
)
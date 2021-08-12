// swift-tools-version:5.0

import PackageDescription

let pkg = Package(name: "PMKUIKit")
pkg.products = [
    .library(name: "PMKUIKit", targets: ["PMKUIKit"]),
]
pkg.dependencies = [
    .package(url: "https://github.com/mxcl/PromiseKit.git", from: "7.0.0-rc2")
]
pkg.swiftLanguageVersions = [.v4, .v4_2, .v5]

let target: Target = .target(name: "PMKUIKit")
target.path = "Sources"
target.exclude = ["UIView", "UIViewController"].flatMap {
    ["\($0)+AnyPromise.m", "\($0)+AnyPromise.h"]
}
target.exclude.append("PMKUIKit.h")

target.dependencies = [
    "PromiseKit"
]

pkg.targets = [target]

pkg.platforms = [
   .iOS(.v10)
]

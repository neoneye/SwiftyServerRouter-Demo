// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyServerRouter-Demo",
    dependencies: [
		.package(url: "https://github.com/neoneye/SwiftyServerRouter.git", .upToNextMajor(from: "0.9.0")),
    ],
    targets: [
        .target(
            name: "SwiftyServerRouter-Demo",
			dependencies: ["SwiftyServerRouter"]),
    ]
)

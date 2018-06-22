// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyServerRouter-Demo",
    dependencies: [
		.package(url: "https://github.com/neoneye/SwiftyServerRouter.git", .upToNextMajor(from: "0.6.0")),
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", .upToNextMajor(from: "3.0.0")),
    ],
    targets: [
        .target(
            name: "SwiftyServerRouter-Demo",
            dependencies: ["SwiftyServerRouter", "PerfectHTTPServer"]),
    ]
)

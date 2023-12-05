// swift-tools-version: 5.9

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "ArgumentParser", package: "swift-argument-parser"),
]

let package = Package(
    name: "AdventOfCode2023",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.3"),
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: dependencies,
            resources: [.copy("Resources")]
        ),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode"] + dependencies
        ),
    ]
)

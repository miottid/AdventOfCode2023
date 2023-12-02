// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdventOfCode2023",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.3"),
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            resources: [
                .process("Resources/day01.txt"),
                .process("Resources/day02.txt"),
            ]
        ),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "AdventOfCode",
            ]
        ),
    ]
)

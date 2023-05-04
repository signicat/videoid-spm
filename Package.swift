// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "eidwebrtc-spm"),
]

let package = Package(
    name: "VideoID",
    products: [
        .library(
            name: "VideoID",
            targets: ["VideoID", "_VideoIDStub"]),
    ],
    dependencies: [
        .package(url: "https://gitlab.electronicid.eu/eid-public/eid-sdk/eidwebrtc-spm", branch: "main")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoID",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID/7.1.33/VideoID.xcframework.zip",
                    checksum: "0c0bb5197585b3c9e6df9461012e8968ff2598694370690e9d779114588bddf5"),
        .target(name: "_VideoIDStub",
               dependencies: dependencies)
    ]
)

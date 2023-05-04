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
                    checksum: "c43f3a74f7fe54b920b3f5e29ae399e0e731195b2dd9f87b39813ac560cb6a20"),
        .target(name: "_VideoIDStub",
               dependencies: dependencies)
    ]
)

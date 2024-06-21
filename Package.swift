// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "7.1.40"

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "eidwebrtc-spm"),
]

let package = Package(
    name: "VideoID",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "VideoID",
            targets: ["VideoID", "_VideoIDStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/signicat/eidwebrtc-spm", from: "1.1.37")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoID",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID/\(version)/VideoID.xcframework.zip",
                    checksum: "8c1765256e84bfb41fe6c9424d12bfaa126492ca73c240a5d38f6dc6d6022870"),
        .target(name: "_VideoIDStub",
               dependencies: dependencies)
    ]
)


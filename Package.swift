// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YPImagePicker",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [ .library(name: "YPImagePicker", targets: ["YPImagePicker"]) ],
    dependencies: [
        .package(url: "https://github.com/tolgaarikan/PryntTrimmerView", .branch("customization"))
    ],
    targets: [
        .target(name: "YPImagePicker", dependencies: ["PryntTrimmerView"]),
        .testTarget(name: "YPImagePickerTests", dependencies: ["YPImagePicker"]),
    ]
)

# JimUtilitySDK
[![Build Status](https://travis-ci.com/RedDragonJ/JimUtilitySDK.svg?branch=master)](https://travis-ci.com/RedDragonJ/JimUtilitySDK)

This package can only be used on iOS projects.

### Setting up with Swift Package Manager
To create an executable project, run the following command:
```ruby
swift package init --type=executable
```
Swift Package sample for xcode project:
```ruby
// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ProjectName",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ProjectName",
            targets: ["ProjectName"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/RedDragonJ/JimSDK.git", from: "NewVersionNumber")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ProjectName",
            dependencies: ["JimSDK"]),
        .testTarget(
            name: "ProjectNameTests",
            dependencies: ["ProjectName"]),
    ]
)
```

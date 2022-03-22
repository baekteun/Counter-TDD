import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let Quick = TargetDependency.package(product: "Quick")
    static let Nimble = TargetDependency.package(product: "Nimble")
}

public extension Package {
    static let Quick = Package.remote(
        url: "https://github.com/Quick/Quick.git",
        requirement: .upToNextMajor(from: "4.0.0")
    )
    static let Nimble = Package.remote(
        url: "https://github.com/Quick/Nimble.git",
        requirement: .upToNextMajor(from: "9.0.0")
    )
}

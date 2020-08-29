// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Files

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Files {
  internal static let file = File(name: "File", ext: nil, path: "", mimeType: "application/octet-stream")
  internal static let testTxt = File(name: "test", ext: "txt", path: "", mimeType: "text/plain")
  internal enum emptyIntermediate {
    internal enum subfolder {
      internal static let anotherVideoMp4 = File(name: "another video", ext: "mp4", path: "empty intermediate/subfolder", mimeType: "video/mp4")
    }
  }
  internal enum subdir {
    internal static let aVideoWithSpacesMp4 = File(name: "A Video With Spaces", ext: "mp4", path: "subdir", mimeType: "video/mp4")
    internal enum subdir {
      internal static let graphicSvg = File(name: "graphic", ext: "svg", path: "subdir/subdir", mimeType: "image/svg+xml")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

internal struct File {
  internal fileprivate(set) var name: String
  internal fileprivate(set) var ext: String?
  internal fileprivate(set) var path: String
  internal fileprivate(set) var mimeType: String

  internal var url: URL {
    url(locale: nil)
  }

  internal func url(locale: Locale?) -> URL {
    let bundle = BundleToken.bundle
    let url = bundle.url(forResource: name, withExtension: ext, subdirectory: path, localization: locale?.identifier)
    guard let result = url else {
      let file = name + (ext ? "." + ext : "")
      fatalError("Could not locate file named \(file)")
    }
    return result
  }

  internal var path: String {
    path(locale: nil)
  }

  internal func path(locale: Locale?) -> String {
    let bundle = BundleToken.bundle
    let path = bundle.path(forResource: name, ofType: ext, inDirectory: path, forLocalization: locale?.identifier)
    guard let result = path else {
      let file = name + (ext ? "." + ext : "")
      fatalError("Could not locate file named \(file)")
    }
    return result
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type

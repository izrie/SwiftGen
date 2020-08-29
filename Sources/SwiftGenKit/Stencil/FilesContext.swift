//
// SwiftGenKit
// Copyright © 2020 SwiftGen
// MIT Licence
//

import Foundation
import PathKit

extension Files.Parser {
  public func stencilContext() -> [String: Any] {
    let files = self.files
      .sorted { lhs, rhs in lhs.name < rhs.name }

    if self.options[Files.Option.structured] {
      return structure(entries: files, usingMapper: map(file:))
    } else {
      return [
        "files": files.map(map(file:))
      ]
    }
  }

  private func map(file: Files.File) -> [String: Any] {
    [
      "name": file.name,
      "ext": file.ext ?? "",
      "path": file.path.joined(separator: Path.separator),
      "mimeType": file.mimeType
    ]
  }

  typealias Mapper = (_ file: Files.File) -> [String: Any]
  private func structure(
    entries: [Files.File],
    atKeyPath keyPath: [String] = [],
    usingMapper mapper: @escaping Mapper
  ) -> [String: Any] {
    var structuredFiles: [String: Any] = [:]
    if let name = keyPath.last {
      structuredFiles["name"] = name
    }

    let files = entries
      .filter { $0.path == keyPath }
      .sorted { $0.name.lowercased() < $1.name.lowercased() }
      .map { mapper($0) }

    if !files.isEmpty {
      structuredFiles["files"] = files
    }

    let childEntries = entries.filter { $0.path.count > keyPath.count }
    let children = Dictionary(grouping: childEntries) { $0.path[keyPath.count] }
      .sorted { $0.key < $1.key }
      .map { name, entries in
        structure(entries: entries, atKeyPath: keyPath + [name], usingMapper: mapper)
      }

    if !children.isEmpty {
      structuredFiles["dirs"] = children
    }

    return structuredFiles
  }
}

# frozen_string_literal: true

Pod::Spec.new do |s|
  s.name         = 'SwiftGen'
  s.version      = '6.6.3'
  s.summary      = 'A collection of Swift tools to generate Swift code for your assets, storyboards, strings, …'

  s.description  = <<-DESC
                   A collection of Swift tools to generate Swift code constants (enums or static lets) for:
                   * asset catalogs,
                   * colors,
                   * fonts
                   * localized strings,
                   * storyboards,
                   * … and more
  DESC

  s.homepage     = 'https://github.com/SwiftGen/SwiftGen'
  s.license      = 'MIT'
  s.author       = {
    'Olivier Halligon' => 'olivier@halligon.net',
    'David Jennes' => 'david.jennes@gmail.com'
  }
  s.social_media_url = 'https://twitter.com/aligatr'

  s.source = {
    http: "https://github.com/izrie/SwiftGen/releases/download/#{s.version}/swiftgen-#{s.version}.zip"
  }
  s.preserve_paths = '*'
  s.exclude_files = '**/file.zip'
end

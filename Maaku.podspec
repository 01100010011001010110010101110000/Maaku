Pod::Spec.new do |s|

  s.name         = "Maaku"
  s.version      = "0.1.0"
  s.summary      = "Swift cmark wrapper with a Swift friendly representation of the AST"

  s.description  = <<-DESC
                   The Maaku framework provides a Swift wrapper around cmark with the addition
                   of a Swift friendly representation of the AST
                   DESC

  s.homepage     = "https://github.com/KristopherGBaker/Maaku"
  s.license      = "MIT"
  s.author             = { "Kristopher Baker" => "Kristopher Baker" }
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/KristopherGBaker/Maaku.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.default_subspec = 'Core'
  
  s.subspec 'CMark' do |core|
      core.source_files = "Maaku/*.h", "Maaku/CMark/**/*.swift", "Maaku/libcmark/**/*"
      core.preserve_paths = "Maaku/libcmark/**/*"
      core.public_header_files = "Maaku/*.h"
      core.pod_target_xcconfig = { "SWIFT_INCLUDE_PATHS" => "$(PODS_TARGET_SRCROOT)/Maaku/libcmark/**", "LIBRARY_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/Maaku/" }
  end
  
  s.subspec 'Core' do |md|
      md.source_files = "Maaku/Core/**/*.swift"
      md.dependency 'Maaku/CMark'
  end
  
  s.subspec 'Plugins' do |plugins|
      plugins.source_files = "Maaku/Plugins/**/*.swift"
      plugins.dependency 'Maaku/CMark'
      plugins.dependency 'Maaku/Core'
  end

end

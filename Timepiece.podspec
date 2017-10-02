Pod::Spec.new do |s|
  s.name         = "Timepiece"
  s.version      = "1.3.1"
  s.summary      = "Intuitive date handling in Swift"
  s.homepage     = "https://github.com/naoty/Timepiece"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Naoto Kaneko" => "naoty.k@gmail.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/naoty/Timepiece.git", :tag => s.version }
  s.source_files  = "Sources/**/*.swift"
  s.requires_arc = true
end


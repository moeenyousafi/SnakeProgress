
Pod::Spec.new do |spec|

  spec.name         = "SnakeProgress"
  spec.version      = "1.0.1"
  spec.summary      = "SnakeProgress provide easy snake like circular progress"
  spec.description  = "SnakeProgress provide easy snake like circular progress and build in view class which developer can set in storyboard and set progress with desired empty/filled colors."
  spec.homepage     = "https://github.com/moeenyousafi/SnakeProgress"
  spec.license      = "MIT"
  spec.author             = { "moeen_yousafi" => "moeen.yousafi@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/moeenyousafi/SnakeProgress.git", :tag => spec.version.to_s }
  spec.source_files  = "SnakeProgress/**/*.{swift}"
  spec.swift_versions = "5.0"
end

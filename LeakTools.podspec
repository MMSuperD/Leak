#
#  Be sure to run `pod spec lint LeakTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "LeakTools"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of LeakTools."

  spec.homepage     = "https://github.com/MMSuperD/Leak"
  spec.license      = "MIT"
  spec.author             = { "MMSuperD" => "shdjxywd@sina.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/MMSuperD/Leak.git", :tag => "#{spec.version}" }
  spec.source_files  = "LeakTools/*.{h,m}"

end

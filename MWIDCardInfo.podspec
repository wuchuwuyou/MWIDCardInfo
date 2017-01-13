#
#  Be sure to run `pod spec lint MWIDCardInfo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "MWIDCardInfo"
  s.version      = "1.0.2"
  s.summary      = "居民身份证信息提取"
  s.description  = <<-DESC
                   This is ID card information for chinese.
                   中华人民共和国居民身份证信息提取
                   DESC
  s.homepage     = "https://github.com/wuchuwuyou/MWIDCardInfo"
  s.license      = "MIT"
  s.author             = { "Murphy" => "tinynorth@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wuchuwuyou/MWIDCardInfo.git", :tag => "1.0.2" }
  s.source_files  = "IDCardInfo/*.{h,m}"
  s.resources = "IDCardInfo/ZoneCode.json","IDCardInfo/ZoneCode.db"  
  s.dependency 'MWIDCardValidate'  
  #s.frameworks ＝ "libsqlite3.0"
  s.libraries = 'sqlite3.0'
end

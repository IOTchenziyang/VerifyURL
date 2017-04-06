#
# Be sure to run `pod lib lint VerifyURL.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VerifyURL'
  s.version          = '0.1.0'
  s.summary          = '检测网页的安全性'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'安心扫SDK提供了网站检测接口，可以检测提供的网页地址是否为钓鱼网址。'
                       DESC

  s.homepage         = 'https://github.com/IOTchenziyang/VerifyURL'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'IOTchenziyang' => '461019012@163.com' }
  s.source           = { :git => 'https://github.com/IOTchenziyang/VerifyURL.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VerifyURL/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VerifyURL' => ['VerifyURL/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Alamofire'
   s.dependency 'CryptoSwift'
   s.dependency 'ReachabilitySwift', '~> 3'
end

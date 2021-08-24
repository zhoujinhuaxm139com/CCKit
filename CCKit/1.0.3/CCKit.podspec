Pod::Spec.new do |spec|
  spec.name         = "CCKit"
  spec.version      = "1.0.3"
  spec.summary      = "色盘取色控件"
  spec.description  = <<-DESC
                    Features:
                    1.色盘取色控件
                    2.暂时只有简单功能
                   DESC
  spec.homepage     = "https://www.baidu.com/"
  spec.license      = "MIT"
  spec.author       = { "周金华" => "zhoujinhua_xm@139.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/zhoujinhuaxm139com/CCKit.git", :tag => spec.version }
  spec.source_files  = "Classes/**/*.{h,m}"
  spec.public_header_files = "Classes/**/*.h"
end

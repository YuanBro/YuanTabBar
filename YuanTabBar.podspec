

Pod::Spec.new do |s|



  s.name         = "YuanTabBar"
  s.version      = "1.1.1"
  s.summary      = "I love coding so I develop it and saved it thank you"


  s.description  = <<-DESC 
                          LZTool 是一个用于保存一些常用工具类的工具
                   DESC

  s.homepage     = "https://github.com/YuanBro/YuanTabBar"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

 

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "YuanBro" => "15821448754@163.com" }
 



  s.source       = { :git => "https://github.com/YuanBro/YuanTabBar.git", :tag => "1.1.1" }


 

  s.source_files  ="YuanTabBar/*.{h,m}"
  #s.exclude_files = "YuanTabBar/Exclude"



   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

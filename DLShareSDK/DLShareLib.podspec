Pod::Spec.new do |s|
  s.name         = "DLShareLib"
  s.version      = "0.0.1"
  s.summary      = "a third Share Library."

  s.description  = <<-DESC
                   this project is a third share Library.
                    DESC
  s.homepage     = "https://github.com/bawangflower/DLShareLib"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "bawangflower" => "flower258@dingtalk.com" }
  s.platform     = :ios,'7.0'
  s.source       = { :git => "https://github.com/bawangflower/DLShareLib.git", :tag => "0.0.1" }

  s.dependency 'Masonry' ,'>= 1.0.0'
  s.requires_arc = true
  s.frameworks = 'TencentOpenAPI'

  s.source_files  = '*.{h,m}','./**/*.{h,m}','TencentOpenAPI/*.{h,m}'
  s.public_header_files = '*.h'

  s.resources = "TencentOpenAPI/TencentOpenApi_IOS_Bundle.bundle"

  s.preserve_paths = "TencentOpenAPI/TencentOpenAPI.framework"

  s.xcconfig = {'LIBRARY_SEARCH_PATHS' =>"$(PODS_ROOT)/TencentOpenAPI/",'FRAMEWORK_SEARCH_PATHS' =>"$(PODS_ROOT)/TencentOpenAPI/",'Header_Search_Paths'=>"$(PODS_ROOT)/TencentOpenAPI/TencentOpenAPI.framework/Headers/"}

end
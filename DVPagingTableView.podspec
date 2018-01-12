Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "DVPagingTableView"
  s.summary = "DVPagingTableView simple paging table view."
  s.requires_arc = true
  s.version = "1.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Dmitriy Virych" => "damienissa@yahoo.com" }
  s.homepage = "https://github.com/dmitryvirych/PagingTableView"
  s.source = { :git => "https://github.com/dmitryvirych/PagingTableView.git", :tag => "#{s.version}"}
  s.source_files = "PagingTableView/**/*.{swift}"
end
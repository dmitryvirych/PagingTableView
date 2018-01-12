Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "DVPagingTableView"
  s.summary = "DVPagingTableView simple paging table view."
  s.requires_arc = true

  # 2
  s.version = "1.0"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4 - Replace with your name and e-mail address
  s.author = { "Dmitriy Virych" => "damienissa@yahoo.com" }
  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/dmitryvirych/PagingTableView"

  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/dmitryvirych/PagingTableView.git", :tag => "#{s.version}"}

  # 7
  s.framework = "UIKit"

  # 8
  s.source_files = "PagingTableView/**/*.{swift}"
end
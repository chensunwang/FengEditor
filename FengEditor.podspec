#
# Be sure to run `pod lib lint FengEditor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FengEditor'
  s.version          = '0.0.5'
  s.summary          = 'Wei feng post special editor.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    This editor is used for Posting and has rich editing functions.
                       DESC

  s.homepage         = 'https://github.com/chensunwang/FengEditor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chensunwang' => '1172665780@qq.com' }
  s.source           = { :git => 'https://github.com/chensunwang/FengEditor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'FengEditor/Classes/**/*'
  
  s.resource_bundles = {
    'FengEditor' => ['FengEditor/Assets/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


# pod更新步骤:

# 1.修改代码/文件

# 2.进入Example文件夹，执行pod install

# 3.版本号更改  s.version = '0.0.5'

# 验证类库 cd 到含有FengEditor.podspec 文件下
# 4.本地校验  pod lib lint FengEditor.podspec --use-libraries --allow-warnings --verbose --no-clean

# 5.提交代码并打对应的tag（tag和podspec文件中保持一致）
## 5.1  git add .
## 5.2  git commit -m '修复textview闪退'
## 5.3  git push
## 5.4  git tag -a 0.0.5 -m 'add tag 0.0.5'
## 5.5  git push origin 0.0.5

# 6.远程校验  pod spec lint FengEditor.podspec --use-libraries --allow-warnings --verbose --no-clean

# 7.打包  pod package FengEditor.podspec --force --exclude-deps --no-mangle --embedded

# 8.提交到cocoapods仓库  pod trunk push FengEditor.podspec --use-libraries --allow-warnings


# 搜索不到上传的库：
# 1.首先移除本地缓存的索引文件  rm ~/Library/Caches/CocoaPods/search_index.json
# 2.更新本地的库到最新  pod repo update

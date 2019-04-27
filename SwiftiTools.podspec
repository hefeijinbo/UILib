Pod::Spec.new do |s|
    s.name         = "SwiftTools"
    s.version      = "1.0"
    s.summary      = 'Swift 工具库'
    s.homepage     = "https://gitee.com/holy/SwiftTools"
    s.license      = 'MIT'
    s.author       = {'kbo' => 'hefeijinbo@163.com'}
    s.source       = { :git => 'https://gitee.com/holy/SwiftTools.git'}
    s.platform     = :ios
    s.source_files = 'SwiftTools/**/*.swift'
    s.resources    = 'SwiftTools/**/*.{png,jpg,xib,storyboard,xcassets}'
end

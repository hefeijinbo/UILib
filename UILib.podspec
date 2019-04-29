Pod::Spec.new do |s|
    s.name         = "UILib"
    s.version      = "1.0"
    s.summary      = 'iOS 常用UI库'
    s.homepage     = "https://github.com/hefeijinbo/UILib"
    s.license      = 'MIT'
    s.author       = {'kbo' => 'jinbo@huami.com'}
    s.source       = { :git => 'https://github.com/hefeijinbo/UILib.git'}
    s.platform     = :ios
    s.source_files = 'SwiftTools/**/*.swift'
    s.resources    = 'SwiftTools/**/*.{png,jpg,xib,storyboard,xcassets}'
    s.swift_version = '4.2'
end


Pod::Spec.new do |s|
  s.name             = 'CodableExtensions'
  s.version          = '0.1.2'
  s.summary          = 'CodableExtensions provides some useful extensions to Swift Decodable'
  s.description      = <<-DESC
Adds extensions to allow custom transformations during decoding. Also makes the interface a bit cleaner.
                       DESC

  s.homepage         = 'https://github.com/jamesruston/CodableExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jamesruston' => 'jruston90@gmail.com' }
  s.source           = { :git => 'https://github.com/jamesruston/CodableExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/james_ruston'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Classes/**/*'
end

Pod::Spec.new do |s|
  s.name = 'PGAvatarView'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Simple rounded view suitable for displaying user avatars.'
  s.homepage = 'https://github.com/paulpilone/PGAvatarView'
  s.social_media_url = 'https://twitter.com/paulpilone'
  s.authors = { 'Paul Pilone' => 'paul@pilone.org' }
  s.source = { :git => 'https://github.com/paulpilone/PGAvatarView.git', :tag => '0.0.1' }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/*.{h,m}'
end

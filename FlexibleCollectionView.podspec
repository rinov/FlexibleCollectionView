Pod::Spec.new do |s|
  s.name             = 'FlexibleCollectionView'
  s.version          = '0.1.0'
  s.summary          = 'An elegant grid layout for UICollectionView.'

  s.description      = <<-DESC
  FlexibleCollectionView can use grid layout without complex steps.
  It keeps beautiful layout flexibly.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/FlexibleCollectionView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryo Ishikawa' => 'rinov@rinov.jp' }
  s.source           = { :git => 'https://github.com/rinov/FlexibleCollectionView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FlexibleCollectionView/Classes/**/*'

  # s.resource_bundles = {
  #   'FlexibleCollectionView' => ['FlexibleCollectionView/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end

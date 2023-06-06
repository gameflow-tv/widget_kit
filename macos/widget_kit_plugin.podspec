#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint widget_kit.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name = 'widget_kit_plugin'
  s.version = '0.0.1'
  s.summary = 'A library for interfacing with a small subset of the WidgetKit API.'
  s.description = <<-DESC
  A library for interfacing with a small subset of the WidgetKit API.
  DESC
  s.homepage = 'http://github.com/gameflow-tv/widget_kit'
  s.license = { :file => '../LICENSE' }
  s.author = { 'Arne Molland' => 'arne@gameflow.tv' }

  s.source = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '11.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end

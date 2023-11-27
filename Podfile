# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FireBaseLoginDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'FirebaseAnalytics'
pod 'FirebaseAuth'
pod 'FirebaseFirestore'
  # Pods for FireBaseLoginDemo

  target 'FireBaseLoginDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FireBaseLoginDemoUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  
installer.pods_project.targets.each do |target|
 target.build_configurations.each do |config|
  if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
   xcconfig_path = config.base_configuration_reference.real_path
   IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
   end
  config.build_settings['IPHONEOS_DEVELOPMENT_TARGET'] = '11.0'
 end
 end
end

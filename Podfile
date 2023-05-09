source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'

use_frameworks!

def shared_pods
  pod 'ExpoFpFplan', '4.0.1'
  pod 'ExpoFpCrowdConnected', '4.0.1'
  pod 'ExpoFpIndoorAtlas', '4.0.1'
  pod 'ExpoFpGpsProvider', '4.0.1'
end

target 'FplanUiKit' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end
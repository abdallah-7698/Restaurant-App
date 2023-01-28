# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Restaurant' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod "RxSwift"
pod "RxCocoa"  
pod 'RxDataSources', '~> 5.0'
pod 'Kingfisher', '~> 5.14'


end


post_install do |pi|
   pi.pods_project.targets.each do |t|
       t.build_configurations.each do |bc|
           if bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] == '12.0'
             bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
           end
       end
   end
end

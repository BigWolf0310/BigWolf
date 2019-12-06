Pod::Spec.new do |s|
s.name = "BigWolf"
s.version = "1.0.0"
s.license = "BW"
s.summary = "RSA加密_test"
s.description  = <<-DESC
   Help developer to quickly intergrate variety of RSA methods
DESC
s.homepage = "https://github.com/BigWolf0310/BigWolf"
s.authors = { "BigWolf0310" => "shangyantao0310@126.com" }
s.source = { :git => "https://github.com/BigWolf0310/BigWolf.git", :tag => "1.0.0"}
s.requires_arc = true
s.ios.deployment_target = "9.0"
s.source_files = "TTTest/TTTest/AppDelegate", "TTTest/TTTest/AppDelegate*.{h,m}", "TTTest/TTTest/TestModel", "TTTest/TTTest/TestModel*.{h,m}", "TTTest/TTTest/TestTableViewCell", "TTTest/TTTest/TestTableViewCell*.{h,m}", "TTTest/TTTest/ViewController", "TTTest/TTTest/ViewController*.{h,m}"
s.dependency 'Masonry'


end
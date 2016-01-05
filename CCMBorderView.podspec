
Pod::Spec.new do |s|

  s.name         = "CCMBorderView"
  s.version      = "1.0.1"
  s.summary      = "CCMBorderView let you easily create views with customizable borders."
  s.description  = <<-DESC
	CCMBorderView is a simple to use view that uses the new IBDesignable and IBInspectable features of Xcode 6 to easily configure a view to have a top border, left border, right border, bottom border, or a combination of those. You can pick the width and color of the border, and you can also give it a corner radius to make rounded corners
                   DESC

  s.homepage     = "https://github.com/cacmartinez/CCMBorderView"
  s.screenshots  = "https://raw.githubusercontent.com/cacmartinez/CCMBorderView/master/Screenshots/screenshot.png"
  s.license      = "APACHE 2.0"
  s.author       = { "Carlos Compean" => "ccompean@icalialabs.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/cacmartinez/CCMBorderView.git", :tag => s.version.to_s }
  s.source_files  = "CCMBorderView/Objective-C/*.{h,m}"
  s.requires_arc = true

end

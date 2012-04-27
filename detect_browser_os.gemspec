# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "detect_browser_os/version"

Gem::Specification.new do |s|
  s.name        = "detect_browser_os"
  s.version     = DetectBrowserOs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@codecrate.com"]
  s.homepage    = "http://github.com/wireframe/detect_browser_os"
  s.summary     = %q{detect end users browser and operating system.}
  s.description = %q{add css classes to your markup based on the end users browser and operating system.}

  s.rubyforge_project = "detect_browser_os"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  s.add_development_dependency(%q<rake>, ["0.9.2.2"])
end

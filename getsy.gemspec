# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "getsy/version"

Gem::Specification.new do |s|
  s.name        = "getsy"
  s.version     = Getsy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Graeme Collins"]
  s.email       = ["graeme.collins.0@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Gets information from the Etsy API}
  s.description = %q{Gets information from the Etsy API and makes it accessible using methods similar to
    the ones found on ActiveRecord objects}

  s.rubyforge_project = "getsy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'htmlentities'
  s.add_dependency 'json'
end

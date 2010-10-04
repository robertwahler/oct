# -*- encoding: utf-8 -*-
require File.expand_path("../lib/oct/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "oct"
  s.version     = Oct::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert Wahler"]
  s.email       = ["robert@gearheadforhire.com"]
  s.homepage    = "http://rubygems.org/gems/oct"
  s.summary     = "Command line octal file permissions"
  s.description = "Command line octal file permissions"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "oct"

  s.add_dependency 'term-ansicolor', '>= 1.0.4'
  s.add_dependency 'configatron', '>= 2.5.1'

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 1.2.9"
  s.add_development_dependency "cucumber", ">= 0.6"
  s.add_development_dependency "aruba", ">= 0.2.0"
  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "yard", ">= 0.6.1"
  s.add_development_dependency "rdiscount", ">= 1.6.5"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'

  s.has_rdoc = 'yard'
  s.rdoc_options     = [ 
                         '--title', 'Oct Documentation', 
                         '--main', 'README.markdown', 
                         '--line-numbers',
                         '--inline-source' 
                       ]
end

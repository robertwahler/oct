# -*- encoding: utf-8 -*-
#
#
Gem::Specification.new do |s|

  # avoid shelling out to run git every time the gemspec is evaluated
  #
  # @see spec/gemspec_spec.rb
  #
  gemfiles_cache = File.join(File.dirname(__FILE__), '.gemfiles')
  if File.exists?(gemfiles_cache)
    gemfiles = File.open(gemfiles_cache, "r") {|f| f.read}
    # normalize EOL
    gemfiles.gsub!(/\r\n/, "\n")
  else
    # .gemfiles missing, run 'rake gemfiles' to create it
    # falling back to 'git ls-files'"
    gemfiles = `git ls-files`
  end

  s.name        = "oct"
  s.version     = File.open(File.join(File.dirname(__FILE__), 'VERSION'), "r") { |f| f.read }
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert Wahler"]
  s.email       = ["robert@gearheadforhire.com"]
  s.homepage    = "http://rubygems.org/gems/oct"
  s.summary     = "Command line octal file permissions"
  s.description = "Command line octal file permissions"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "oct"

  s.add_dependency 'term-ansicolor', '>= 1.0.4'

  s.add_development_dependency "bundler", ">= 1.0.14"
  s.add_development_dependency "rspec", "~> 2.9.0"
  s.add_development_dependency "aruba", "= 0.4.5"
  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "cucumber", "~> 1.1.9"

  s.files        = gemfiles.split("\n")
  s.executables  = gemfiles.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_paths = ["lib"]

  s.rdoc_options     = [
                         '--title', 'Oct Documentation',
                         '--main', 'README.markdown',
                         '--line-numbers',
                         '--inline-source'
                       ]
end

# require all files here
require 'rbconfig'
require 'oct/core/hash'
require 'oct/core/array'
require 'oct/app'
require 'oct/settings'
require 'oct/oct'

# Master namespace
module Oct

  # Contents of the VERSION file
  #
  # Example format: 0.0.1
  #
  # @return [String] the contents of the version file in #.#.# format
  def self.version
    version_info_file = File.join(File.dirname(__FILE__), *%w[.. VERSION])
    File.open(version_info_file, "r") do |f|
      f.read.strip
    end
  end

  # Platform constants
  unless defined?(BasicGem::WINDOWS)
    WINDOWS = RbConfig::CONFIG['host_os'] =~ /mswin|mingw/i
    CYGWIN = RbConfig::CONFIG['host_os'] =~ /cygwin/i
  end

end

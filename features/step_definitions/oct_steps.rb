require 'fileutils'

Given /^file "([^"]*)" is chmod (\d+)$/ do |filename, permissions|
  in_current_dir do
    FileUtils.chmod permissions.to_i(8), filename
  end
end

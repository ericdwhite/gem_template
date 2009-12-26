# Setup the  for use with
# rspec
require 'spec'
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |task|
  task.libs << 'lib'
end

#
# Gem Packaging
require 'rake/gempackagetask'
gem_spec = eval(File.read('gtemplate.gemspec'))
Rake::GemPackageTask.new(gem_spec) do |p|
  p.gem_spec = gem_spec
  p.need_tar = true
  p.need_zip = true
end

#
# Gem Management

# To explictly install in the system gem cache use:
# $ sudo rake <command>
#
# This will only add 'sudo' if no writable Gem paths are found.
def gem_cmd
  @gem_cmd ||= begin    
                 gem_cmd = Gem.platforms.last.os == "java" ? 'jgem' : 'gem'
                 return gem_cmd if Gem.win_platform?
                 gem_cmd = Gem.path.find { |p| File.writable? p } ? gem_cmd : "sudo #{gem_cmd}"
               end
end

desc "Install the created gem."
task :install => :gem do
  system("#{gem_cmd} install pkg/#{gem_spec.name}-#{gem_spec.version}.gem")
end

desc "Uninstall the gem."
task :uninstall do
  #
  # gem uninstall seems to only try the first path
  # to uninstall gems from.  On my system the gems
  # are located in ~/.gem which happens to be the
  # second path.  This bit of code tries
  # to remove the gem from ALL the gem paths.
  #
  # To remove system gems as well as local gems use:
  #
  # $ sudo rake uninstall
  #
  "Using gem command: #{gem_cmd}"
  Gem.path.each do |gem_path|
    puts "Trying to remove gem from path: #{gem_path}"
    system("#{gem_cmd} uninstall #{gem_spec.name} --version '=#{gem_spec.version}' --install-dir=#{gem_path}")
  end
end

desc "Delete generated files"
task :clean => :clobber_package do
    # all handled by dependencies for now. 
end

$:.unshift('lib')
require 'gtemplate'

Gem::Specification.new do |s|
  s.author = "Eric D. White"
  s.email = 'eric@ericwhite.ca'
  s.homepage = "http://ericwhite.ca"

  s.name = 'gtemplate'
  s.version = Gtemplate::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.summary = "Useful tool for averaging numbers."
  s.description = "Simple library that can be used for averaging numbers. " +
    "It also deomonstrates how to use rspec, and flexmock."
  #s.rubyforge_project = ""

  s.files = Dir['CHANGELOG', 'MIT-LICENSE', 'README', 'lib/**/*', 'spec/**/*']
  s.has_rdoc = true
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('rspec', '~> 1.2.9')
end

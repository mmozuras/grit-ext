# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'grit/ext/version'

Gem::Specification.new do |s|
  s.name        = 'grit-ext'
  s.version     = Grit::Ext::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Mindaugas Mozūras'
  s.email       = 'mindaugas.mozuras@gmail.com'
  s.homepage    = 'http://github.org/mmozuras/grit-ext'
  s.summary     = 'grit-ext'
  s.description = 'Collection of extensions for grit'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files         = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'grit', '~> 2.5', '>= 2.5.0'
  s.add_development_dependency 'rake', '~> 10.1', '>= 10.1.0'
  s.add_development_dependency 'rspec', '~> 2.13', '>= 2.13.0'
end

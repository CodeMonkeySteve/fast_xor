require 'bundler'
Bundler.setup

require 'rake'
require 'rake/extensiontask'
require 'rubygems/package_task'
require 'rspec/core/rake_task'

gem = Gem::Specification.load( File.dirname(__FILE__) + '/fast_xor.gemspec' )
Rake::ExtensionTask.new( 'xor', gem )

Gem::PackageTask.new gem  do |pkg|
  pkg.need_zip = pkg.need_tar = false
end

RSpec::Core::RakeTask.new :spec  do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => [:compile, :spec]


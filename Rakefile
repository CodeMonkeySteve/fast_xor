require 'rake'
require 'rake/clean'
require 'rake/extensiontask'
require 'rake/testtask'
require 'jeweler'

namespace 'xor' do
  desc "Build the XOR extension"
  Rake::ExtensionTask.new :xor do |t|
    t.dir = 'ext'
  end
end

task :test => 'xor:xor'
Rake::TestTask.new do |t|
  t.libs << 'ext'
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
end

task :all => ['xor:xor', :test]
task :default => :all

Jeweler::Tasks.new do |g|
  g.name = 'fast_xor'
  g.summary = 'Fast String XOR operator'
  g.description = 'Provides a C-optimized method for in-place XORing of two (or three) strings'
  g.email = 'steve@finagle.org'
  g.homepage = 'http://github.com/CodeMonkeySteve/fast_xor'
  g.authors = ['Steve Sloan']

  g.files = %w(
    README.rdoc MIT-LICENSE
    rake/extensiontask.rb
    ext/xor.c
    test/test_xor.rb
    test/benchmark.rb
  )
  g.extensions = ['Rakefile']
  g.require_paths = %w(ext)

#  g.has_rdoc = true
#  g.rdoc_options = %w| --line-numbers --inline-source --main README.rdoc |
end
Jeweler::GemcutterTasks.new

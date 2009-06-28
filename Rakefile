require 'rake'
require 'rake/clean'
require 'rake/extensiontask'
require 'rake/testtask'

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

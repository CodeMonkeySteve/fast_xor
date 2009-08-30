# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name =    'fast_xor'
  s.version = '1.0.1'
  s.date = '2009-08-30'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.platform = Gem::Platform::RUBY

  s.authors = ['Steve Sloan']
  s.email = 'steve@finagle.org'
  s.homepage = 'http://github.com/CodeMonkeySteve/fast_xor'
  s.summary = 'Fast String XOR operator'
  s.description = 'Provides a C-optimized method for in-place XORing of two strings'

  s.files = %w|
    README.rdoc MIT-LICENSE
    rake/extensiontask.rb
    ext/xor.c
    test/test_xor.rb
    test/benchmark.rb
  |

  s.extensions = ['Rakefile']
  s.require_paths = %w(ext)
#  s.has_rdoc = true
#  s.rdoc_options = %w| --line-numbers --inline-source --main README.rdoc |
#  s.extra_rdoc_files = %w| README.rdoc |

#  s.rubyforge_project = s.name
#  s.rubygems_version = %q{1.3.0}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
  end
end

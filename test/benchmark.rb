#!/usr/bin/env ruby
$: << File.dirname($0) + '/../ext'
require 'benchmark'

class String
  def slow_xor!(other)
    i = 0
    other.each_byte { |b|  self[i] ^= b ; i += 1 }
  end

 require 'xor'
 alias_method :fast_xor!, :xor!
end

a = ([255].pack('C')) * (2**17)   # 128k
b = a.dup

n = 10
Benchmark.bm do |x|
  x.report('Ruby:') do  n.times { a.slow_xor! b }  end
  x.report('C   :') do  n.times { a.fast_xor! b }  end
end


require 'test/unit'
require 'xor'

class XORTest < Test::Unit::TestCase
  def setup
    @len = 16
    @zero = [0x00].pack('C') * @len
    @one  = [0xFF].pack('C') * @len
    @x = (0...@len).collect { rand 256 }.pack('C*')
    @invx = (0...@len).collect { |i| @x[i] ^ 0xFF }.pack('C*')
  end

  def assert_equal( a, b )
    super a.unpack('H*'), b.unpack('H*')
  end

  def test_xor_same
    assert_equal @zero, @x.dup.xor!(@x)
    assert_equal @one,  @x.dup.xor!(@invx)
    assert_equal @x,    @x.dup.xor!(@zero)
    assert_equal @invx, @x.dup.xor!(@one)
  end

  def test_xor2_same
    assert_equal @x,    @x.dup.xor!(@x, @x)
    assert_equal @invx, @x.dup.xor!(@x, @invx)
    assert_equal @zero, @x.dup.xor!(@x, @zero)
    assert_equal @one,  @x.dup.xor!(@x, @one)

    assert_equal @invx, @x.dup.xor!(@invx, @x)
    assert_equal @x,    @x.dup.xor!(@invx, @invx)
    assert_equal @one,  @x.dup.xor!(@invx, @zero)
    assert_equal @zero, @x.dup.xor!(@invx, @one)

    assert_equal @zero, @x.dup.xor!(@zero, @x)
    assert_equal @one,  @x.dup.xor!(@zero, @invx)
    assert_equal @invx, @x.dup.xor!(@zero, @one)
    assert_equal @x,    @x.dup.xor!(@zero, @zero)

    assert_equal @one,  @x.dup.xor!(@one, @x)
    assert_equal @zero, @x.dup.xor!(@one, @invx)
    assert_equal @invx, @x.dup.xor!(@one, @zero)
    assert_equal @x,    @x.dup.xor!(@one, @one)
  end
end

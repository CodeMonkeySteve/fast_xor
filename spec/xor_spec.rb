require 'xor'

describe String do
  before do
    @len = 16
    @zero = [0x00].pack('C') * @len
    @one  = [0xFF].pack('C') * @len
    @x = (0...@len).collect { rand 256 }.pack('C*')
    @invx = (0...@len).collect { |i| @x[i].ord ^ 0xFF }.pack('C*')
  end

  it "two" do
    @x.dup.xor!(@x)   .should == @zero
    @x.dup.xor!(@invx).should == @one
    @x.dup.xor!(@zero).should == @x
    @x.dup.xor!(@one) .should == @invx
  end

  it "three" do
    @x.dup.xor!(@x, @x)   .should == @x
    @x.dup.xor!(@x, @invx).should == @invx
    @x.dup.xor!(@x, @zero).should == @zero
    @x.dup.xor!(@x, @one) .should == @one

    @x.dup.xor!(@invx, @x)   .should == @invx
    @x.dup.xor!(@invx, @invx).should == @x
    @x.dup.xor!(@invx, @zero).should == @one
    @x.dup.xor!(@invx, @one) .should == @zero

    @x.dup.xor!(@zero, @x)   .should == @zero
    @x.dup.xor!(@zero, @invx).should == @one
    @x.dup.xor!(@zero, @one) .should == @invx
    @x.dup.xor!(@zero, @zero).should == @x

    @x.dup.xor!(@one, @x)   .should == @one
    @x.dup.xor!(@one, @invx).should == @zero
    @x.dup.xor!(@one, @zero).should == @invx
    @x.dup.xor!(@one, @one) .should == @x
  end
end

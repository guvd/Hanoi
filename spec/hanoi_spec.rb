require './spec/spec_helper'
require './lib/hanoi'

describe Hanoi do

  before(:each) do
    @hanoi = Hanoi.new
  end

  it "has only discs on rod A after starting" do
    @hanoi.rod(:a).wont_be_empty
    @hanoi.rod(:b).must_be_empty
    @hanoi.rod(:c).must_be_empty
  end

  it "should be able discs to an empty rod" do
    @hanoi.move(:a, :b)
    @hanoi.rod(:b).wont_be_empty
  end

   it "should not allow to move a disc from an empty stack" do
    @hanoi.allowed_move(:b, :c).must_equal(false)
    lambda{ @hanoi.move(:b, :c)}.must_raise(Exception)
  end

  it "should be allowed to put a smaller disc on a bigger disc" do
    @hanoi.move(:a, :b)
    @hanoi.allowed_move(:b, :a).must_equal(true)
  end

  it "should not be allowed to put a bigger disc on a smaller disc" do
    @hanoi.move(:a, :b)
    @hanoi.allowed_move(:a, :b).must_equal(false)
    lambda{ @hanoi.move(:a, :b) }.must_raise(Exception)
  end

  it "should be finished when all discs are on the last rod" do
    @hanoi.finished?.must_equal(false)
    @hanoi.move :a, :c
    @hanoi.move :a, :b
    @hanoi.move :c, :b

    @hanoi.move :a, :c

    @hanoi.move :b, :a
    @hanoi.move :b, :c
    @hanoi.finished?.must_equal(false)
    @hanoi.move :a, :c

    @hanoi.finished?.must_equal(true)
  end

end

require 'helper'
require 'set'

class TestArrayUtils < Test::Unit::TestCase
  def setup
    @array = Faker::ArrayUtils.const_array("a".."c")
    @elems = Set.new("a".."c")
  end

  it "provides a way of freezing the elements and itself" do
    assert @array.respond_to?(:freeze_all)
    @array.freeze_all
    assert @array.frozen?
    @array.each { |e| assert e.frozen?  }
  end

  it "provides a way of getting a random element" do
    set = Set.new
    1000.times { set << @array.rand }
    assert set == @elems
  end

  it "provides a way of getting n random elements" do
    assert_equal @array.random_pick(3).sort, @array.sort

    1.upto(3) do |n|
      1000.times do
        new_arr = @array.random_pick(n)
        assert_equal n, new_arr.length
        new_arr.each do |e|
          assert @elems.include? e
        end
      end
    end
  end

  it "provides a way of shuffling the array" do
    assert_equal @array.shuffle.sort, @array.sort

    different_arrangements = 0

    1000.times do
      new_arr = @array.shuffle
      assert new_arr.to_set == @elems
      different_arrangements += 1 if new_arr != @array
    end

    assert different_arrangements > 0
  end
end

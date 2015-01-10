# encoding: utf-8

require 'helper'
require 'set'

class TestArrayUtils < Test::Unit::TestCase
  def setup
    @array = Faker::ArrayUtils.const_array("a".."c")
    @elems = Set.new("a".."c")
  end

  def test_provides_a_way_of_freezing_the_elements_and_itself
    assert @array.respond_to?(:freeze_all)
    @array.freeze_all
    assert @array.frozen?
    @array.each { |e| assert e.frozen?  }
  end

  def test_provides_a_way_of_getting_a_random_element
    set = Set.new
    1000.times { set << @array.sample }
    assert set == @elems
  end

   def test_provides_a_way_of_getting_n_random_elements
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

  def test_provides_a_way_of_shuffling_the_array
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

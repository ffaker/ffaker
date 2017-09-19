# encoding: utf-8

require 'helper'
require 'set'

class TestArrayUtils < Test::Unit::TestCase
  include DeterministicHelper

  def setup
    @array = FFaker::ArrayUtils.const_array('a'..'c')
    @elems = Set.new('a'..'c')
  end

  def test_provides_a_way_of_freezing_the_elements_and_itself
    assert @array.respond_to?(:freeze_all)
    @array.freeze_all
    assert @array.frozen?
    @array.each { |e| assert e.frozen? }
  end

  def test_provides_a_way_of_getting_a_random_element
    set = Set.new
    1000.times { set << @array.sample }
    assert set == @elems
  end

  def test_provides_a_way_of_getting_n_random_elements
    assert_equal @array.sample(3).sort, @array.sort

    1.upto(3) do |n|
      1000.times do
        new_arr = @array.sample(n)
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

  def test_self_random_pick_is_deterministic
    supress_warn_output do
      array = Array.new(10) { rand(0..9) }
      assert_deterministic { FFaker::ArrayUtils.random_pick(array, 3) }
    end
  end

  def test_self_rand_is_deterministic
    supress_warn_output do
      array = Array.new(10) { rand(0..9) }
      assert_deterministic { FFaker::ArrayUtils.rand(array) }
    end
  end

  def test_self_shuffle_is_deterministic
    array = Array.new(10) { rand(0..9) }
    assert_deterministic { FFaker::ArrayUtils.shuffle(array) }
  end

  def test_rand_is_deterministic
    supress_warn_output do
      assert_deterministic { @array.rand }
    end
  end

  def test_random_pick_is_deterministic
    supress_warn_output do
      assert_deterministic { @array.random_pick(2) }
    end
  end

  def test_shuffle_is_deterministic
    assert_deterministic { @array.shuffle }
  end

  private

  # Supress the deprecation warning that some methods output, so we get less
  # noise in our test run.
  def supress_warn_output
    original_verbosity = $VERBOSE
    $VERBOSE = nil
    yield
    $VERBOSE = original_verbosity
  end
end

# encoding: utf-8

require 'helper'

# Author: PapePathe<pathe.sene@gmail.com> github.com/PapePathe 
class TestFakerNameFR < Test::Unit::TestCase

  def setup
    @tester = Faker::NameFR
  end

  def test_last_name
    assert Faker::NameFR::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name
    assert Faker::NameFR::FIRST_NAMES.include?(@tester.first_name)
  end

  def test_prefix
    assert Faker::NameFR::PREFIX.include?(@tester.prefix)
  end


  def test_name
    # => split the name into an array of words
    parts = @tester.name.split(' ')

    if parts.count == 3
      # the value at the index 1 should be a valid! prefix
      assert Faker::NameFR::PREFIX.include?(parts[1])

      # the value at the index 0 should be a valid! male_first_name
      assert Faker::NameFR::FIRST_NAMES.include?(parts[0])

      # the value at the index 2 should be a valid! last_name
      assert Faker::NameFR::LAST_NAMES.include?(parts[2])

    elsif parts.count == 2
      # the value at the index 0 should be a valid! prefix
      assert Faker::NameFR::FIRST_NAMES.include?(parts[0])

      # the value at the index 1 should be a valid! last_name
      assert Faker::NameFR::LAST_NAMES.include?(parts[1])
    end
  end

end

# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameFR,
    :first_name, :last_name, :prefix
  )

  def setup
    @tester = FFaker::NameFR
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
  end

  def test_prefix
    assert_include @tester::PREFIX, @tester.prefix
  end

  def test_name
    # => split the name into an array of words
    parts = @tester.name.split(' ')
    case parts.count
    when 3
      first_name, prefix, last_name = parts
      # the value at the index 1 should be a valid! prefix
      assert_include @tester::PREFIX, prefix

      # the value at the index 0 should be a valid! first_name
      assert_include @tester::FIRST_NAMES, first_name

      # the value at the index 2 should be a valid! last_name
      assert_include @tester::LAST_NAMES, last_name
    when 2
      first_name, last_name = parts
      # the value at the index 0 should be a valid! first_name
      assert_include @tester::FIRST_NAMES, first_name

      # the value at the index 1 should be a valid! last_name
      assert_include @tester::LAST_NAMES, last_name
    end
  end
end

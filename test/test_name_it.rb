# encoding: utf-8

require 'helper'

# Author: PapePathe<pathe.sene@gmail.com> github.com/PapePathe
class TestFakerNameIT < Minitest::Test
  def setup
    @tester = FFaker::NameIT
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_includes @tester::FIRST_NAMES, @tester.first_name
  end

  def test_prefix
    assert_includes @tester::PREFIX, @tester.prefix
  end

  def test_name
    # => split the name into an array of words
    parts = @tester.name.split(' ')

    case parts.count
    when 3
      prefix, first_name, last_name = parts
      # the value at the index 0 should be a valid! prefix
      assert_includes @tester::PREFIX, prefix

      # the value at the index 1 should be a valid! first_name
      assert_includes @tester::FIRST_NAMES, first_name

      # the value at the index 2 should be a valid! last_name
      assert_includes @tester::LAST_NAMES, last_name
    when 2
      first_name, last_name = parts
      # the value at the index 0 should be a valid! first_name
      assert_includes @tester::FIRST_NAMES, first_name

      # the value at the index 1 should be a valid! last_name
      assert_includes @tester::LAST_NAMES, last_name
    end
  end
end

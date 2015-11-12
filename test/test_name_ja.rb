# encoding: utf-8

require 'helper'

class TestFakerNameJA < Minitest::Test
  def setup
    @tester = FFaker::NameJA
  end

  def test_first_name
    assert_includes(@tester::FIRST_NAMES, @tester.first_name)
  end

  def test_last_name
    assert_includes(@tester::LAST_NAMES, @tester.last_name)
  end

  def test_last_first
    assert_last_first(@tester.last_first)
  end

  def test_name
    assert_last_first(@tester.name)
  end

  private

  def assert_last_first(actual)
    last_first_regexp = /(#{@tester::LAST_NAMES.join('|')})(#{@tester::FIRST_NAMES.join('|')})/
    assert_match(last_first_regexp, actual)
  end
end

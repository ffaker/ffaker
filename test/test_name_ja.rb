# encoding: utf-8

require 'helper'

class TestFakerNameJA < Test::Unit::TestCase
  class << self
    def startup
      FFaker::NameJA.const_set(:FIRST_NAMES, %w[あきら フミ 三郎])
      FFaker::NameJA.const_set(:LAST_NAMES, %w[佐藤 高橋 佐々木])
    end

    def shutdown
      FFaker::NameJA.class_eval { remove_const(:FIRST_NAMES) }
      FFaker::NameJA.class_eval { remove_const(:LAST_NAMES) }
    end
  end

  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameJA,
    :last_name, :first_name, :last_first, :name
  )

  def setup
    @tester = FFaker::NameJA
  end

  def test_first_name
    assert_include(@tester::FIRST_NAMES, @tester.first_name)
  end

  def test_last_name
    assert_include(@tester::LAST_NAMES, @tester.last_name)
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

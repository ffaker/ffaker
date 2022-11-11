# frozen_string_literal: true

require_relative 'helper'

class TestJoJo < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::JoJo, :full_name, :first_name, :last_name, :stand)

  def setup
    @tester = FFaker::JoJo
  end

  def test_full_name
    assert_include @tester::FULL_NAMES, @tester.full_name
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_stand
    assert_include @tester::STANDS, @tester.stand
  end
end

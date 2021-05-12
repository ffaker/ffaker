# frozen_string_literal: true

require_relative 'helper'

class TestNameVN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameVN,
    :last_name, :first_name, :middle_name, :name, :last_first
  )

  def setup
    @tester = FFaker::NameVN
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
  end

  def test_middle_name
    assert_include @tester::MIDDLE_NAMES, @tester.middle_name
  end

  def test_name
    (middle_name, first_name, last_name) = @tester.name.split(' ')
    assert_include @tester::FIRST_NAMES, first_name
    assert_include @tester::MIDDLE_NAMES, middle_name
    assert_include @tester::LAST_NAMES, last_name
  end

  def test_last_first
    (last_name, middle_name, first_name) = @tester.last_first.split(' ')
    assert_include @tester::FIRST_NAMES, first_name
    assert_include @tester::MIDDLE_NAMES, middle_name
    assert_include @tester::LAST_NAMES, last_name
  end
end

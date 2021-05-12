# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameAR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameAR,
    :first_name_male, :first_name_female, :last_name,
    :name_male, :name_female
  )

  def setup
    @tester = FFaker::NameAR
  end

  def test_first_name_male
    assert_include(@tester::FIRST_NAMES_MALE, @tester.first_name_male)
  end

  def test_first_name_female
    assert_include(@tester::FIRST_NAMES_FEMALE, @tester.first_name_female)
  end

  def test_last_name
    assert_include(@tester::LAST_NAMES, @tester.last_name)
  end

  def test_name_male
    expected = @tester::FIRST_NAMES_MALE.product(@tester::LAST_NAMES).map { |set| set.join(' ') }
    assert_include(expected, @tester.name_male)
  end

  def test_name_female
    expected = @tester::FIRST_NAMES_FEMALE.product(@tester::LAST_NAMES).map { |set| set.join(' ') }
    assert_include(expected, @tester.name_female)
  end
end

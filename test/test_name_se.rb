# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameSE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameSE,
    :last_name, :first_name_male, :first_name_female,
    :prefix, :first_name, :name
  )

  def setup
    @tester = FFaker::NameSE
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name_male
    assert_include @tester::FIRST_NAMES_MALE, @tester.first_name_male
  end

  def test_first_name_female
    assert_include @tester::FIRST_NAMES_FEMALE, @tester.first_name_female
  end

  def test_prefix
    assert_include @tester::PREFIXES, @tester.prefix
  end

  def test_first_name
    parts = @tester.first_name.split(' ')
    assert_include [1, 2], parts.count
  end

  def test_name
    parts = @tester.name.split(' ')
    assert_include [2, 3, 4], parts.count
  end
end

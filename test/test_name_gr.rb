# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameGR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameGR,
    :male_first_name, :male_last_name, :female_first_name, :female_last_name,
    :male_full_name, :female_full_name, :last_name, :first_name
  )

  def setup
    @tester = FFaker::NameGR
  end

  def test_male_first_name
    assert_include @tester::MALE_FIRST_NAMES, @tester.male_first_name
  end

  def test_male_last_name
    assert_include @tester::MALE_LAST_NAMES, @tester.male_last_name
  end

  def test_female_first_name
    assert_include @tester::FEMALE_FIRST_NAMES, @tester.female_first_name
  end

  def test_female_last_name
    assert_include @tester::FEMALE_LAST_NAMES, @tester.female_last_name
  end

  def test_male_full_name
    names = @tester.male_full_name.split(' ')
    assert_include @tester::MALE_FIRST_NAMES, names[0]
    assert_include @tester::MALE_LAST_NAMES, names[1]
  end

  def test_female_full_name
    names = @tester.female_full_name.split(' ')
    assert_include @tester::FEMALE_FIRST_NAMES, names[0]
    assert_include @tester::FEMALE_LAST_NAMES, names[1]
  end

  # For random names
  def test_last_name
    all_names = @tester::MALE_LAST_NAMES + @tester::FEMALE_LAST_NAMES
    assert_include all_names, @tester.last_name
  end

  def test_first_name
    all_names = @tester::MALE_FIRST_NAMES + @tester::FEMALE_FIRST_NAMES
    assert_include all_names, @tester.first_name
  end

  def test_full_name_male
    names = @tester.full_name(:male).split(' ')
    assert_include @tester::MALE_FIRST_NAMES, names[0]
    assert_include @tester::MALE_LAST_NAMES, names[1]
    assert_deterministic { @tester.full_name(:male) }
  end

  def test_full_name_female
    names = @tester.full_name(:female).split(' ')
    assert_include @tester::FEMALE_FIRST_NAMES, names[0]
    assert_include @tester::FEMALE_LAST_NAMES, names[1]
    assert_deterministic { @tester.full_name(:female) }
  end
end

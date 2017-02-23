# encoding: UTF-8
# frozen_string_literal: true

require 'helper'

class TestFakerNamePL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NamePL,
    :name, :name_with_prefix, :last_name, :first_name, :female_name_with_prefix,
    :male_name_with_prefix, :female_full_name, :male_full_name, :female_first_name,
    :female_last_name, :male_first_name, :male_last_name, :prefix,
    :female_prefix, :male_prefix, :academic_degree_prefix
  )

  def setup
    @tester = FFaker::NamePL
  end

  def test_name
    assert_match(/(\w+\.? ?){2}/, @tester.name)
  end

  def name_with_prefix
    prefix, first_name, last_name = @tester.name_with_prefix.split
    assert_include(@tester::PREFIXES, prefix)
    refute_empty(first_name)
    refute_empty(last_name)
  end

  def test_female_name_with_prefix
    prefix, first_name, last_name = @tester.female_name_with_prefix.split
    assert_include(@tester::FEMALE_PREFIXES, prefix)
    assert_include(@tester::FEMALE_FIRST_NAMES, first_name)
    assert_include(@tester::FEMALE_LAST_NAMES, last_name)
  end

  def test_male_name_with_prefix
    prefix, first_name, last_name = @tester.male_name_with_prefix.split
    assert_include(@tester::MALE_PREFIXES, prefix)
    assert_include(@tester::MALE_FIRST_NAMES, first_name)
    assert_include(@tester::MALE_LAST_NAMES, last_name)
  end

  def test_female_full_name
    first_name, last_name = @tester.female_full_name.split
    assert_include(@tester::FEMALE_FIRST_NAMES, first_name)
    assert_include(@tester::FEMALE_LAST_NAMES, last_name)
  end

  def test_male_full_name
    first_name, last_name = @tester.male_full_name.split
    assert_include(@tester::MALE_FIRST_NAMES, first_name)
    assert_include(@tester::MALE_LAST_NAMES, last_name)
  end

  def test_first_name
    first_names = @tester::FEMALE_FIRST_NAMES + @tester::MALE_FIRST_NAMES
    assert_include(first_names, @tester.first_name)
  end

  def test_first_name_with_argument
    assert_include(@tester::FEMALE_FIRST_NAMES, @tester.first_name(:female))
  end

  def test_female_first_name
    assert_include(@tester::FEMALE_FIRST_NAMES, @tester.female_first_name)
  end

  def test_male_first_name
    assert_include(@tester::MALE_FIRST_NAMES, @tester.male_first_name)
  end

  def test_last_name
    last_names = @tester::FEMALE_LAST_NAMES + @tester::MALE_LAST_NAMES
    assert_include(last_names, @tester.last_name)
  end

  def test_last_name_with_argument
    assert_include(@tester::MALE_LAST_NAMES, @tester.last_name(:male))
  end

  def test_female_last_name
    assert_include(@tester::FEMALE_LAST_NAMES, @tester.female_last_name)
  end

  def test_male_last_name
    assert_include(@tester::MALE_LAST_NAMES, @tester.male_last_name)
  end

  def test_prefix
    assert_include(@tester::PREFIXES, @tester.prefix)
  end

  def test_female_prefix
    assert_include(@tester::FEMALE_PREFIXES, @tester.female_prefix)
  end

  def test_male_prefix
    assert_include(@tester::MALE_PREFIXES, @tester.male_prefix)
  end

  def test_academic_degree_prefix
    assert_include(@tester::ACADEMIC_DEGREE_PREFIXES, @tester.academic_degree_prefix)
  end

  def test_name_for_gender_raises_argument_error
    error = assert_raises(ArgumentError) { @tester.send(:name_for_gender, :name, :vodka) }
    assert_match("Gender must be one of: #{@tester::GENDERS}", error.message)
  end
end

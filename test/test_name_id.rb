# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameID < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameID,
    :name, :name_with_prefix, :first_name, :first_name_female, :first_name_male,
    :last_name, :prefix, :female_prefix, :male_prefix
  )

  def setup
    @tester = FFaker::NameID
  end

  def test_name
    assert_match(/\A[a-zA-Z\s]+\z/, @tester.name)
  end

  def test_name_with_prefix
    prefix, name, last_name = @tester.name_with_prefix.split(/\s+/)
    assert_include(@tester::PREFIXES, prefix)
    refute_empty(name)
    refute_empty(last_name)
  end

  def test_female_name_with_prefix
    prefix, name, last_name = @tester.female_name_with_prefix.split(/\s+/)
    assert_include(@tester::FEMALE_PREFIXES, prefix)
    assert_include(@tester::FIRST_NAMES_FEMALE, name)
    refute_empty(last_name)
  end

  def test_male_name_with_prefix
    prefix, name, last_name = @tester.male_name_with_prefix.split(/\s+/)
    assert_include(@tester::MALE_PREFIXES, prefix)
    assert_include(@tester::FIRST_NAMES_MALE, name)
    refute_empty(last_name)
  end

  def test_first_name
    assert_include(@tester::FIRST_NAMES, @tester.first_name)
  end

  def test_first_name_female
    assert_include @tester::FIRST_NAMES_FEMALE, @tester.first_name_female
  end

  def test_first_name_male
    assert_include @tester::FIRST_NAMES_MALE, @tester.first_name_male
  end

  def test_last_name
    assert_include(@tester::LAST_NAMES, @tester.last_name)
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
end

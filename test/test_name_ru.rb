# frozen_string_literal: true

require_relative 'helper'

class TestNameRU < Test::Unit::TestCase
  include DeterministicHelper

  RU_REGEX = /\A[а-яА-Я]{2,}\z/.freeze
  RU_REGEX_MULTIPLE_WORDS = /\A[а-яА-Я\s]+\z/.freeze

  assert_methods_are_deterministic(
    FFaker::NameRU,
    :name, :first_name, :last_name, :female_name, :male_name,
    :first_name_female, :first_name_male, :middle_name_female,
    :middle_name_male, :last_name_female, :last_name_male
  )

  def setup
    @tester = FFaker::NameRU
  end

  def test_name
    assert_match(RU_REGEX_MULTIPLE_WORDS, @tester.name)
    assert_include [1, 2, 3], @tester.name.split(' ').count
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
    assert_match(RU_REGEX, @tester.first_name)
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
    assert_match(RU_REGEX, @tester.last_name)
  end

  def test_female_name
    assert_match(RU_REGEX_MULTIPLE_WORDS, @tester.female_name)
    assert_include [1, 2, 3], @tester.female_name.split(' ').count
  end

  def test_male_name
    assert_match(RU_REGEX_MULTIPLE_WORDS, @tester.male_name)
    assert_include [1, 2, 3], @tester.male_name.split(' ').count
  end

  def test_first_name_female
    assert_include @tester::FIRST_NAMES_FEMALE, @tester.first_name_female
    assert_match(RU_REGEX, @tester.first_name_female)
  end

  def test_first_name_male
    assert_include @tester::FIRST_NAMES_MALE, @tester.first_name_male
    assert_match(RU_REGEX, @tester.first_name_male)
  end

  def test_middle_name_female
    assert_include @tester::MIDDLE_NAMES_FEMALE, @tester.middle_name_female
    assert_match(RU_REGEX, @tester.middle_name_female)
  end

  def test_middle_name_male
    assert_include @tester::MIDDLE_NAMES_MALE, @tester.middle_name_male
    assert_match(RU_REGEX, @tester.middle_name_male)
  end

  def test_last_name_female
    assert_include @tester::LAST_NAMES_FEMALE, @tester.last_name_female
    assert_match(RU_REGEX, @tester.last_name_female)
  end

  def test_last_name_male
    assert_include @tester::LAST_NAMES_MALE, @tester.last_name_male
    assert_match(RU_REGEX, @tester.last_name_male)
  end
end

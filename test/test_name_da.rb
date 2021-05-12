# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameDA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameDA,
    :any_name, :male_name, :female_name, :last_name, :prefix
  )

  RU_REGEX = /[А-Я][а-я]+/.freeze

  def setup
    @tester = FFaker::NameDA
  end

  def test_name
    assert_raise(ArgumentError, 'Invalid gender, must be one of :any, :male, :female') do
      @tester.name(:hahaha)
    end
  end

  def test_any_name
    assert_less_than @tester.any_name.count(' '), 3
  end

  def test_male_name
    regexp = /#{@tester::MALE_FIRST_NAMES.join('|')}/
    assert_less_than @tester.male_name.count(' '), 3
    assert_match(regexp, @tester.male_name)
  end

  def test_female_name
    regexp = /#{@tester::FEMALE_FIRST_NAMES.join('|')}/
    assert_less_than @tester.female_name.count(' '), 3
    assert_match(regexp, @tester.female_name)
  end

  def test_first_name
    assert_include @tester::MALE_FIRST_NAMES, @tester.first_name(:male)
    assert_include @tester::FEMALE_FIRST_NAMES, @tester.first_name(:female)
    first_names = @tester::MALE_FIRST_NAMES + @tester::FEMALE_FIRST_NAMES
    assert_include first_names, @tester.first_name(:any)
    assert_include first_names, @tester.first_name
    assert_raise(ArgumentError, 'Invalid gender, must be one of :any, :male, :female') do
      @tester.first_name(:hahaha)
    end
  end

  def test_last_name
    assert_match(/\A['a-z]+\z/i, @tester.last_name)
  end

  def test_prefix
    assert_match(/\A(?:Hr|Fr|Dr|Prof)\.\Z/, @tester.prefix)
  end
end

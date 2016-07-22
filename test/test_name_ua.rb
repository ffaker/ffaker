# encoding: utf-8

require 'helper'

class TestNameUA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameUA,
    :first_name_female, :first_name_male, :first_name,
    :last_name_female, :last_name_male, :last_name,
    :middle_name_female, :middle_name_male, :name
  )

  def setup
    @tester = FFaker::NameUA

    @single_word_name_regexp    = /\A[а-яА-ЯіїєґІЇЄҐ’\-]+\z/
    @multiple_words_name_regexp = /\A[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/
  end

  def test_first_name_male
    assert_include @tester::FIRST_NAMES_MALE, @tester.first_name_male
    assert_match(@single_word_name_regexp, @tester.first_name_male)
  end

  def test_first_name_female
    assert_include @tester::FIRST_NAMES_FEMALE, @tester.first_name_female
    assert_match(@single_word_name_regexp, @tester.first_name_female)
  end

  def test_middle_name_male
    assert_include @tester::MIDDLE_NAMES_MALE, @tester.middle_name_male
    assert_match(@single_word_name_regexp, @tester.middle_name_male)
  end

  def test_middle_name_female
    assert_include @tester::MIDDLE_NAMES_FEMALE, @tester.middle_name_female
    assert_match(@single_word_name_regexp, @tester.middle_name_female)
  end

  def test_last_name_male
    assert_include @tester::LAST_NAMES_MALE, @tester.last_name_male
    assert_match(@single_word_name_regexp, @tester.last_name_male)
  end

  def test_last_name_female
    assert_include @tester::LAST_NAMES_FEMALE, @tester.last_name_female
    assert_match(@single_word_name_regexp, @tester.last_name_female)
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
    assert_match(@single_word_name_regexp, @tester.first_name)
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
    assert_match(@single_word_name_regexp, @tester.last_name)
  end

  def test_name
    8.times do
      assert_match(@multiple_words_name_regexp, @tester.name)
      assert_include [1, 2, 3], @tester.name.split(' ').count
    end
  end
end

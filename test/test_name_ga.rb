# encoding: utf-8

require 'helper'

class TestFakerNameGa < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameGA
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

  def test_name_male
    # => split the name_male into an array of words
    first_name, last_name = @tester.name_male.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert_include @tester::FIRST_NAMES_MALE, first_name

    # the value at the index 1 should be a valid! last_name
    assert_include @tester::LAST_NAMES, last_name
  end

  def test_name_female
    # => split the name_male into an array of words
    first_name, last_name = @tester.name_female.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert_include @tester::FIRST_NAMES_FEMALE, first_name

    # the value at the index 1 should be a valid! last_name
    assert_include @tester::LAST_NAMES, last_name
  end

  def test_name
    # => split the name_male into an array of words
    first_name, last_name = @tester.name.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert_include(@tester::FIRST_NAMES_FEMALE + @tester::FIRST_NAMES_MALE, first_name)

    # the value at the index 1 should be a valid! last_name
    assert_include @tester::LAST_NAMES, last_name
  end
end

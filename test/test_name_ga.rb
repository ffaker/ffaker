# encoding: utf-8

require 'helper'

class TestFakerNameGa < Test::Unit::TestCase

  def setup
    @tester = FFaker::NameGA
  end

  def test_last_name
    assert FFaker::NameGA::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name_male
    assert FFaker::NameGA::FIRST_NAMES_MALE.include?(@tester.first_name_male)
  end

  def test_first_name_female
    assert FFaker::NameGA::FIRST_NAMES_FEMALE.include?(@tester.first_name_female)
  end

  def test_name_male
    # => split the name_male into an array of words
    parts = @tester.name_male.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert FFaker::NameGA::FIRST_NAMES_MALE.include?(parts[0])

    # the value at the index 1 should be a valid! last_name
    assert FFaker::NameGA::LAST_NAMES.include?(parts[1])
  end

  def test_name_female
    # => split the name_male into an array of words
    parts = @tester.name_female.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert FFaker::NameGA::FIRST_NAMES_FEMALE.include?(parts[0])

    # the value at the index 1 should be a valid! last_name
    assert FFaker::NameGA::LAST_NAMES.include?(parts[1])
  end


  def test_name
    # => split the name_male into an array of words
    parts = @tester.name.split(' ')

    # the value at the index 0 should be a valid! male_prefix
    assert FFaker::NameGA::FIRST_NAMES_FEMALE.include?(parts[0]) || FFaker::NameGA::FIRST_NAMES_MALE.include?(parts[0])

    # the value at the index 1 should be a valid! last_name
    assert FFaker::NameGA::LAST_NAMES.include?(parts[1])
  end
end

# encoding: utf-8

require 'helper'

class TestFakerNameNB < Test::Unit::TestCase

  def setup
    @tester = FFaker::NameNB
  end

  def test_last_name
    assert FFaker::NameNB::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name_male
    assert FFaker::NameNB::FIRST_NAMES_MALE.include?(@tester.first_name_male)
  end

  def test_first_name_female
    assert FFaker::NameNB::FIRST_NAMES_FEMALE.include?(@tester.first_name_female)
  end

  def test_prefix
    assert FFaker::NameNB::PREFIXES.include?(@tester.prefix)
  end

  def test_first_name
    parts = @tester.first_name.split(' ')
    assert [1,2].include? parts.count
  end

  def test_name
    parts = @tester.name.split(' ')
    assert [2, 3, 4].include? parts.count
  end

end


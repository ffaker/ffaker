# encoding: utf-8

require 'helper'

class TestFakerNameSE < Test::Unit::TestCase

  def setup
    @tester = Faker::NameSE
  end

  def test_last_name
    assert Faker::NameSE::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name_male
    assert Faker::NameSE::FIRST_NAMES_MALE.include?(@tester.first_name_male)
  end

  def test_first_name_female
    assert Faker::NameSE::FIRST_NAMES_FEMALE.include?(@tester.first_name_female)
  end

  def test_prefix
    assert Faker::NameSE::PREFIXES.include?(@tester.prefix)
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


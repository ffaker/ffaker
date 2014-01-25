# encoding: utf-8

require 'helper'

# Author: PapePathe<pathe.sene@gmail.com> github.com/PapePathe
class TestFakerNameSn < Test::Unit::TestCase

  def setup
    @tester = Faker::NameSN
  end

  def test_last_name
    assert Faker::NameSN::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name_male
    assert Faker::NameSN::FIRST_NAMES_MALE.include?(@tester.first_name_male)
  end

  def test_first_name_female
    assert Faker::NameSN::FIRST_NAMES_FEMALE.include?(@tester.first_name_female)
  end

  def test_prefix_male
    assert Faker::NameSN::PREFIX_MALE.include?(@tester.prefix_male)
  end

  def test_prefix_female
    assert Faker::NameSN::PREFIX_FEMALE.include?(@tester.prefix_female)
  end

  def test_name_male
    # => split the name_male into an array of words
    parts = @tester.name_male.split(' ')

    if parts.count == 3
      # the value at the index 0 should be a valid! male_prefix
      assert Faker::NameSN::PREFIX_MALE.include?(parts[0])

      # the value at the index 1 should be a valid! male_first_name
      assert Faker::NameSN::FIRST_NAMES_MALE.include?(parts[1])

      # the value at the index 2 should be a valid! last_name
      assert Faker::NameSN::LAST_NAMES.include?(parts[2])

    elsif parts.count == 2
      # the value at the index 0 should be a valid! male_prefix
      assert Faker::NameSN::FIRST_NAMES_MALE.include?(parts[0])

      # the value at the index 1 should be a valid! last_name
      assert Faker::NameSN::LAST_NAMES.include?(parts[1])
    end
  end

  def test_name_female
    # => split the name_female into an array of words
    parts = @tester.name_female.split(' ')

    if parts.count == 3
      # the value at the index 0 should be a valid! male_prefix
      assert Faker::NameSN::PREFIX_FEMALE.include?(parts[0])

      # the value at the index 1 should be a valid! male_first_name
      assert Faker::NameSN::FIRST_NAMES_FEMALE.include?(parts[1])

      # the value at the index 2 should be a valid! last_name
      assert Faker::NameSN::LAST_NAMES.include?(parts[2])
    elsif parts.count == 2
      # the value at the index 0 should be a valid! male_prefix
      assert Faker::NameSN::FIRST_NAMES_FEMALE.include?(parts[0])

      # the value at the index 1 should be a valid! last_name
      assert Faker::NameSN::LAST_NAMES.include?(parts[1])
    end
  end

  def test_senegalese_name
    # => split the name into an array of words
    parts = @tester.name_sn.split(' ')

    if parts.count == 3
      # the value at the index 0 should be a valid! male or female prefix
      assert Faker::NameSN::PREFIX_FEMALE.include?(parts[0]) || Faker::NameSN::PREFIX_MALE.include?(parts[0])

      # the value at the index 1 should be a valid! firstname male or female
      assert Faker::NameSN::FIRST_NAMES_FEMALE.include?(parts[1]) || Faker::NameSN::FIRST_NAMES_MALE.include?(parts[1])

      # the value at the index 2 should be a valid! firstname male or female
      assert Faker::NameSN::LAST_NAMES.include?(parts[2])
    elsif parts.count == 2
      # the value at the index 0 should be a valid! firstname male or female
      assert Faker::NameSN::FIRST_NAMES_FEMALE.include?(parts[0]) || Faker::NameSN::FIRST_NAMES_MALE.include?(parts[0])

      # the value at the index 0 should be a valid! firstname male or female
      assert Faker::NameSN::LAST_NAMES.include?(parts[1])
    end
  end
end

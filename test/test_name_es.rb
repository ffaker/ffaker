# encoding: utf-8

require 'helper'

# Author: guapolo github.com/guapolo
class TestFakerNameES < Test::Unit::TestCase

  def setup
    @tester = Faker::NameES
    @all_names = Faker::NameES::MALE_FIRST_NAMES + Faker::NameES::FEMALE_FIRST_NAMES
  end

  def test_last_name
    assert Faker::NameES::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name
    assert @all_names.include?(@tester.first_name)
  end

  def test_middle_name
    assert @all_names.include?(@tester.middle_name)
  end

  def test_name
    assert @all_names.include?(@tester.name)
  end

  def test_prefix_male
    assert Faker::NameES::MALE_PREFIXES.include?(@tester.male_prefix)
  end

  def test_prefix_female
    assert Faker::NameES::FEMALE_PREFIXES.include?(@tester.female_prefix)
  end

  def test_prefix
    assert Faker::NameES::PREFIXES.include?(@tester.prefix)
  end

  def test_male_name
    parts = @tester.male_name.split(' ')
    case parts.count
    when 1 then assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[0])
    when 2 then assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[0]) &&
      Faker::NameES::MALE_FIRST_NAMES.include?(parts[1])
    end
  end

  def test_female_name
    parts = @tester.female_name.split(' ')
    case parts.count
    when 1 then assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[0])
    when 2 then assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[0]) &&
      Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[1])
    end
  end

  def test_full_name_male
    parts = @tester.full_name(:male).split(' ')
    case parts.count
    when 5
      assert Faker::NameES::MALE_PREFIXES.include?(parts[0])
      assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[1])
      # Middle name
      assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
      assert Faker::NameES::LAST_NAMES.include?(parts[4])
    when 4
      prefix_or_first_name = Faker::NameES::MALE_PREFIXES.include?(parts[0]) ||
        Faker::NameES::MALE_FIRST_NAMES.include?(parts[0])
      assert prefix_or_first_name
      assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
    when 3
      assert Faker::NameES::MALE_FIRST_NAMES.include?(parts[0])
      assert Faker::NameES::LAST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
    else
      flunk "Invalid Male Name"
    end
  end

  def test_full_name_female
    parts = @tester.full_name(:female).split(' ')
    case parts.count
    when 5
      assert Faker::NameES::FEMALE_PREFIXES.include?(parts[0])
      assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[1])
      # Middle name
      assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
      assert Faker::NameES::LAST_NAMES.include?(parts[4])
    when 4
      prefix_or_first_name = Faker::NameES::FEMALE_PREFIXES.include?(parts[0]) ||
        Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[0])
      assert prefix_or_first_name
      assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
    when 3
      assert Faker::NameES::FEMALE_FIRST_NAMES.include?(parts[0])
      assert Faker::NameES::LAST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
    else
      flunk "Invalid Female Name"
    end
  end

  def test_full_name
    parts = @tester.full_name.split(' ')
    case parts.count
    when 5
      assert Faker::NameES::PREFIXES.include?(parts[0])
      assert @all_names.include?(parts[1])
      # Middle name
      assert @all_names.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
      assert Faker::NameES::LAST_NAMES.include?(parts[4])
    when 4
      prefix_or_first_name = Faker::NameES::PREFIXES.include?(parts[0]) ||
        @all_names.include?(parts[0])
      assert prefix_or_first_name
      assert @all_names.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
    when 3
      assert @all_names.include?(parts[0])
      assert Faker::NameES::LAST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
    else
      flunk "Invalid Name"
    end
  end

  def test_full_name_no_prefix
    parts = @tester.full_name_no_prefix.split(' ')
    case parts.count
    when 4
      assert @all_names.include?(parts[0])
      assert @all_names.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
    when 3
      assert @all_names.include?(parts[0])
      assert Faker::NameES::LAST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
    else
      flunk "Invalid Name"
    end
  end

  def test_full_name_prefix
    parts = @tester.full_name_prefix.split(' ')
    case parts.count
    when 5
      assert Faker::NameES::PREFIXES.include?(parts[0])
      assert @all_names.include?(parts[1])
      # Middle name
      assert @all_names.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
      assert Faker::NameES::LAST_NAMES.include?(parts[4])
    when 4
      prefix_or_first_name = Faker::NameES::PREFIXES.include?(parts[0]) ||
        @all_names.include?(parts[0])
      assert prefix_or_first_name
      assert @all_names.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
      assert Faker::NameES::LAST_NAMES.include?(parts[3])
    when 3
      assert @all_names.include?(parts[0])
      assert Faker::NameES::LAST_NAMES.include?(parts[1])
      assert Faker::NameES::LAST_NAMES.include?(parts[2])
    else
      flunk "Invalid Name"
    end
  end

end

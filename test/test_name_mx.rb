# encoding: utf-8

require 'helper'

# Author: guapolo github.com/guapolo
class TestFakerNameMX < Minitest::Test
  def setup
    @tester = FFaker::NameMX
    @all_names = @tester::MALE_FIRST_NAMES + @tester::FEMALE_FIRST_NAMES
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_includes @all_names, @tester.first_name
  end

  def test_middle_name
    assert_includes @all_names, @tester.middle_name
  end

  def test_name
    assert_includes @all_names, @tester.name
  end

  def test_prefix_male
    assert_includes @tester::MALE_PREFIXES, @tester.male_prefix
  end

  def test_prefix_female
    assert_includes @tester::FEMALE_PREFIXES, @tester.female_prefix
  end

  def test_prefix
    assert_includes @tester::PREFIXES, @tester.prefix
  end

  def test_male_name
    parts = @tester.male_name.split(' ')
    case parts.count
    when 1
      assert_includes @tester::MALE_FIRST_NAMES, parts[0]
    when 2
      assert_includes @tester::MALE_FIRST_NAMES, parts[0]
      assert_includes @tester::MALE_FIRST_NAMES, parts[1]
    end
  end

  def test_female_name
    parts = @tester.female_name.split(' ')
    case parts.count
    when 1
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[0]
    when 2
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[0]
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[1]
    end
  end

  def test_full_name_male
    parts = @tester.full_name(:male).split(' ')
    case parts.count
    when 5
      assert_includes @tester::MALE_PREFIXES, parts[0]
      assert_includes @tester::MALE_FIRST_NAMES, parts[1]
      # Middle name
      assert_includes @tester::MALE_FIRST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
      assert_includes @tester::LAST_NAMES, parts[4]
    when 4
      prefix_or_first_name = @tester::MALE_PREFIXES.include?(parts[0]) ||
                             @tester::MALE_FIRST_NAMES.include?(parts[0])
      assert prefix_or_first_name
      assert_includes @tester::MALE_FIRST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
    when 3
      assert_includes @tester::MALE_FIRST_NAMES, parts[0]
      assert_includes @tester::LAST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
    else
      flunk 'Invalid Male Name'
    end
  end

  def test_full_name_female
    parts = @tester.full_name(:female).split(' ')
    case parts.count
    when 5
      assert_includes @tester::FEMALE_PREFIXES, parts[0]
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[1]
      # Middle name
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
      assert_includes @tester::LAST_NAMES, parts[4]
    when 4
      prefix_or_first_name = @tester::FEMALE_PREFIXES.include?(parts[0]) ||
                             @tester::FEMALE_FIRST_NAMES.include?(parts[0])
      assert prefix_or_first_name
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
    when 3
      assert_includes @tester::FEMALE_FIRST_NAMES, parts[0]
      assert_includes @tester::LAST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
    else
      flunk 'Invalid Female Name'
    end
  end

  def test_full_name
    parts = @tester.full_name.split(' ')
    case parts.count
    when 5
      assert_includes @tester::PREFIXES, parts[0]
      assert_includes @all_names, parts[1]
      # Middle name
      assert_includes @all_names, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
      assert_includes @tester::LAST_NAMES, parts[4]
    when 4
      prefix_or_first_name = @tester::PREFIXES.include?(parts[0]) ||
                             @all_names.include?(parts[0])
      assert prefix_or_first_name
      assert_includes @all_names, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
    when 3
      assert_includes @all_names, parts[0]
      assert_includes @tester::LAST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
    else
      flunk 'Invalid Name'
    end
  end

  def test_full_name_no_prefix
    parts = @tester.full_name_no_prefix.split(' ')
    case parts.count
    when 4
      assert_includes @all_names, parts[0]
      assert_includes @all_names, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
    when 3
      assert_includes @all_names, parts[0]
      assert_includes @tester::LAST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
    else
      flunk 'Invalid Name'
    end
  end

  def test_full_name_prefix
    parts = @tester.full_name_prefix.split(' ')
    case parts.count
    when 5
      assert_includes @tester::PREFIXES, parts[0]
      assert_includes @all_names, parts[1]
      # Middle name
      assert_includes @all_names, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
      assert_includes @tester::LAST_NAMES, parts[4]
    when 4
      prefix_or_first_name = @tester::PREFIXES.include?(parts[0]) ||
                             @all_names.include?(parts[0])
      assert prefix_or_first_name
      assert_includes @all_names, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
      assert_includes @tester::LAST_NAMES, parts[3]
    when 3
      assert_includes @all_names, parts[0]
      assert_includes @tester::LAST_NAMES, parts[1]
      assert_includes @tester::LAST_NAMES, parts[2]
    else
      flunk 'Invalid Name'
    end
  end
end

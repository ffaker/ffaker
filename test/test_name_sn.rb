# encoding: utf-8

require 'helper'

# Author: PapePathe<pathe.sene@gmail.com> github.com/PapePathe
class TestFakerNameSn < Minitest::Test
  def setup
    @tester = FFaker::NameSN
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name_male
    assert_includes @tester::FIRST_NAMES_MALE, @tester.first_name_male
  end

  def test_first_name_female
    assert_includes @tester::FIRST_NAMES_FEMALE, @tester.first_name_female
  end

  def test_prefix_male
    assert_includes @tester::PREFIX_MALE, @tester.prefix_male
  end

  def test_prefix_female
    assert_includes @tester::PREFIX_FEMALE, @tester.prefix_female
  end

  def test_name_male
    parts = @tester.name_male.split(' ')
    assert_includes [2, 3], parts.count

    case parts.count
    when 3
      male_prefix, male_first_name, last_name = parts

      assert_includes @tester::PREFIX_MALE, male_prefix
      assert_includes @tester::FIRST_NAMES_MALE, male_first_name
      assert_includes @tester::LAST_NAMES, last_name
    when 2
      male_first_name, last_name = parts

      assert_includes @tester::FIRST_NAMES_MALE, male_first_name
      assert_includes @tester::LAST_NAMES, last_name
    end
  end

  def test_name_female
    parts = @tester.name_female.split(' ')
    assert_includes [2, 3], parts.count

    case parts.count
    when 3
      female_prefix, female_first_name, last_name = parts

      assert_includes @tester::PREFIX_FEMALE, female_prefix
      assert_includes @tester::FIRST_NAMES_FEMALE, female_first_name
      assert_includes @tester::LAST_NAMES, last_name
    when 2
      female_first_name, last_name = parts

      assert_includes @tester::FIRST_NAMES_FEMALE, female_first_name
      assert_includes @tester::LAST_NAMES, last_name
    end
  end

  def test_senegalese_name
    parts = @tester.name_sn.split(' ')
    assert_includes [2, 3], parts.count

    case parts.count
    when 3
      prefix, first_name, last_name = parts
      assert_includes(@tester::PREFIX_FEMALE + @tester::PREFIX_MALE, prefix)
      assert_includes(@tester::FIRST_NAMES_FEMALE + @tester::FIRST_NAMES_MALE, first_name)
      assert_includes @tester::LAST_NAMES, last_name
    when 2
      first_name, last_name = parts
      assert_includes(@tester::FIRST_NAMES_FEMALE + @tester::FIRST_NAMES_MALE, first_name)
      assert_includes @tester::LAST_NAMES, last_name
    end
  end
end

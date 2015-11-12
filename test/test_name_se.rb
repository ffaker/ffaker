# encoding: utf-8

require 'helper'

class TestFakerNameSE < Minitest::Test
  def setup
    @tester = FFaker::NameSE
  end

  def test_last_name
    assert_includes @tester::LAST_NAMES, (@tester.last_name)
  end

  def test_first_name_male
    assert_includes @tester::FIRST_NAMES_MALE, (@tester.first_name_male)
  end

  def test_first_name_female
    assert_includes @tester::FIRST_NAMES_FEMALE, (@tester.first_name_female)
  end

  def test_prefix
    assert_includes @tester::PREFIXES, (@tester.prefix)
  end

  def test_first_name
    parts = @tester.first_name.split(' ')
    assert_includes [1, 2], parts.count
  end

  def test_name
    parts = @tester.name.split(' ')
    assert_includes [2, 3, 4], parts.count
  end
end

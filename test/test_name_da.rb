# encoding: utf-8

require 'helper'

class TestFakerNameDA < Test::Unit::TestCase
  RU_REGEX = /[А-Я][а-я]+/

  def setup
    @tester = FFaker::NameDA
  end

  def test_name
    assert_raise { @tester.name(:hahaha) }
  end

  def test_any_name
    assert @tester.any_name.count(' ') < 3
  end

  def test_male_name
    regexp = %r(#{@tester::MALE_FIRST_NAMES.join('|')})
    assert @tester.male_name.count(' ') < 3
    assert_match regexp, @tester.male_name
  end

  def test_female_name
    regexp = %r(#{@tester::FEMALE_FIRST_NAMES.join('|')})
    assert @tester.female_name.count(' ') < 3
    assert_match regexp, @tester.female_name
  end

  def test_first_name
    assert_include @tester::MALE_FIRST_NAMES, @tester.first_name(:male)
    assert_include @tester::FEMALE_FIRST_NAMES, @tester.first_name(:female)
    first_names = @tester::MALE_FIRST_NAMES + @tester::FEMALE_FIRST_NAMES
    assert_include first_names, @tester.first_name(:any)
    assert_include first_names, @tester.first_name
    assert_raise { @tester.first_name(:hahaha) }
  end

  def test_last_name
    assert_match /\A['a-z]+\z/i, @tester.last_name
  end

  def test_prefix
    assert_match /\A(?:Hr|Fr|Dr|Prof)\.\Z/, @tester.prefix
  end
end

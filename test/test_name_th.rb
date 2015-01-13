# encoding: utf-8

require 'helper'

class TestFakerNameTH < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameTH
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
  end

  def test_nick_name
    assert_include @tester::NICK_NAMES, @tester.nick_name
  end

  def test_name
    first_name, last_name = @tester.name.split(' ')
    assert_include @tester::FIRST_NAMES, first_name
    assert_include @tester::LAST_NAMES, last_name
  end
end

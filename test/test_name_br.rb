# encoding: UTF-8

require 'helper'

class TestFakerNameBR < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameBR
  end

  def test_name
    assert_match(/\A[a-zA-ZéúôóíáÍã\s]+\z/, @tester.name)
  end

  def test_name_with_prefix
    prefix, name = @tester.name_with_prefix.split(/\s+/)
    assert_include(@tester::PREFIXES, prefix)
    assert(name.length > 0)
  end

  def test_first_name
    assert_include(@tester::FIRST_NAMES, @tester.first_name)
  end

  def test_last_name
    assert_include(@tester::LAST_NAMES, @tester.last_name)
  end

  def test_prefix
    assert_include(@tester::PREFIXES, @tester.prefix)
  end
end

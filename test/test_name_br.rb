# encoding: UTF-8

require 'helper'

class TestFakerNameBR < Test::Unit::TestCase
  def setup
    @tester = Faker::NameBR
  end

  def test_name
    assert_match /[[:alpha:]]+ [[:alpha:]]+/, @tester.name
  end

  def test_name_with_prefix
    prefixes = @tester::PREFIXES
    parts = @tester.name_with_prefix.split(/\s+/)
    assert prefixes.include?(parts.first)
    assert(parts[1].length > 0)
  end

  def test_first_name
    assert @tester::FIRST_NAMES.include? @tester.first_name
  end

  def test_last_name
    assert @tester::LAST_NAMES.include? @tester.last_name
  end

  def test_prefix
    assert @tester::PREFIXES.include? @tester.prefix
  end
end

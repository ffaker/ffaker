# encoding: utf-8

require 'helper'

class TestFakerNamePH < Test::Unit::TestCase
  PH_REGEXP = /\A([\wñÑú-]+\.? ?){2,5}\z/

  def setup
    @tester = FFaker::NamePH
  end

  def test_name
    assert_match(PH_REGEXP, @tester.name)
  end

  def test_last_name
    assert_match(PH_REGEXP, @tester.last_name)
  end

  def test_first_name
    assert_match(PH_REGEXP, @tester.first_name)
  end

  def test_prefix
    assert_match(/\A[A-Z][a-z]+\.?\z/, @tester.prefix)
  end
end

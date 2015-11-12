# encoding: utf-8

require 'helper'

class TestFakerNameDE < Minitest::Test
  def setup
    @tester = FFaker::NameDE
  end

  def test_name
    assert_match(/\A([\w']+\.? ?){2,3}\z/, @tester.name)
  end

  def test_prefix
    assert_match(/\A[A-Z][a-z]+\.?\z/, @tester.prefix)
  end

  def test_suffix
    assert_includes(@tester::SUFFIXES, @tester.suffix)
  end
end

# encoding: utf-8

require 'helper'

class TestCompany < Minitest::Test
  def setup
    @tester = FFaker::Company
  end

  def test_bs
    assert_match(/\A[ \w'\/-]+\z/, @tester.bs)
  end

  def test_catch_phrase
    assert_match(/\A[ \w'\/-]+\z/, @tester.catch_phrase)
  end

  def test_name
    assert_match(/\A[ \w,'-]+\z/, @tester.name)
  end

  def test_suffix
    assert_includes @tester::SUFFIXES, @tester.suffix
  end
end

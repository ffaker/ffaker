# encoding: utf-8

require 'helper'

class TestFakerNameCN < Test::Unit::TestCase
  def setup
    @tester = Faker::NameCN
  end

  def test_name
    assert_match(/\A.{2,}\z/, @tester.name)
  end

  def test_first_name
    assert_match(/\A.{1,2}\z/, @tester.first_name)
  end

  def test_last_name
    assert_match(/\A.{1,5}\z/, @tester.last_name)
  end
end

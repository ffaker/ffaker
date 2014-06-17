# encoding: utf-8

require File.dirname(__FILE__) + '/helper'

class TestCompanySE < Test::Unit::TestCase

  def test_name
    assert_match(/[ a-z]+/, Faker::CompanySE.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, Faker::CompanySE.suffix)
  end
end

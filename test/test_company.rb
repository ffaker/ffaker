# encoding: utf-8

require 'helper'

class TestCompany < Test::Unit::TestCase
  def test_bs
    assert_match /[ a-z]+/, Faker::Company.bs
    assert_match /\s/, Faker::Company.bs
  end

  def test_catch_phrase
    assert_match /[ a-z]+/, Faker::Company.catch_phrase
    assert_match /\s/, Faker::Company.catch_phrase
  end

  def test_name
    assert_match /[ a-z]+/, Faker::Company.name
  end

  def test_suffix
    assert_match /[ a-z]+/i, Faker::Company.suffix
  end
end

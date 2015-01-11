# encoding: utf-8

require 'helper'

class TestCompany < Test::Unit::TestCase
  def test_bs
    assert_match /[ a-z]+/, FFaker::Company.bs
    assert_match /\s/, FFaker::Company.bs
  end

  def test_catch_phrase
    assert_match /[ a-z]+/, FFaker::Company.catch_phrase
    assert_match /\s/, FFaker::Company.catch_phrase
  end

  def test_name
    assert_match /[ a-z]+/, FFaker::Company.name
  end

  def test_suffix
    assert_match /[ a-z]+/i, FFaker::Company.suffix
  end
end

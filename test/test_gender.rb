# encoding: utf-8

require 'helper'

class TestFakerGender < Test::Unit::TestCase
  def setup
    @tester = FFaker::Gender
  end

  def test_random
    gender_regex = /\A(male|female)\z/
    assert_match gender_regex, @tester.random
  end
end

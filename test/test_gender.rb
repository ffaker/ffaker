# encoding: utf-8

require 'helper'

class TestFakerGender < Test::Unit::TestCase
  def setup
    @tester = Faker::Gender
  end

  def test_random
    generder_regex = /['male', 'female']/
    assert_match generder_regex, @tester.random.to_s
  end

end

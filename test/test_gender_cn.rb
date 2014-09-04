# encoding: utf-8

require 'helper'

class TestFakerGenderCN < Test::Unit::TestCase
  def setup
    @tester = Faker::GenderCN
  end

  def test_random
    generder_regex = /['男', '女']/
    assert_match generder_regex, @tester.random.to_s
  end

end

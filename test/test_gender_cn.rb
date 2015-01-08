# encoding: utf-8

require 'helper'

class TestFakerGenderCN < Test::Unit::TestCase
  def setup
    @tester = Faker::GenderCN
  end

  def test_random
    gender_regex = /\A[男女]\z/
    assert_match gender_regex, @tester.random
  end

end

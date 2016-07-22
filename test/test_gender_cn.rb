# encoding: utf-8

require 'helper'

class TestFakerGenderCN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::GenderCN, :random)

  def setup
    @tester = FFaker::GenderCN
  end

  def test_random
    gender_regex = /\A[男女]\z/
    assert_match(gender_regex, @tester.random)
  end
end

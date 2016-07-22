# encoding: utf-8

require 'helper'

class TestFakerGenderBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::GenderBR, :random)

  def setup
    @tester = FFaker::GenderBR
  end

  def test_random
    gender_regex = /\A(feminino|masculino)\z/
    assert_match(gender_regex, @tester.random)
  end
end

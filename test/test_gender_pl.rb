# frozen_string_literal: true

require_relative 'helper'

class TestFakerGenderPL < Test::Unit::TestCase
  include DeterministicHelper

  GENDER_REGEX = /\A(kobieta|mężczyzna)\z/.freeze

  assert_methods_are_deterministic(FFaker::GenderPL, :random)

  def setup
    @tester = FFaker::GenderPL
  end

  def test_random
    assert_match(GENDER_REGEX, @tester.random)
  end

  def test_sample
    assert_match(GENDER_REGEX, @tester.sample)
  end

  def test_maybe
    assert_match(GENDER_REGEX, @tester.maybe)
  end
end

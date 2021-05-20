# frozen_string_literal: true

require_relative 'helper'

class TestFakerGenderKR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::GenderKR, :random)

  def setup
    @tester = FFaker::GenderKR
  end

  def test_random
    gender_regex = /\A[남녀]\z/
    assert_match(gender_regex, @tester.random)
  end

  def test_sample
    gender_regex = /\A[남녀]\z/
    assert_match(gender_regex, @tester.sample)
  end

  def test_maybe
    gender_regex = /\A[남녀]\z/
    assert_match(gender_regex, @tester.maybe)
  end
end

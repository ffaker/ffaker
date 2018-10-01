# encoding: utf-8
# frozen_string_literal: true

require 'helper'

class TestFakerGenderJP < Test::Unit::TestCase
  include DeterministicHelper

  GENDER_REGEX = /\A[女男]\z/

  assert_methods_are_deterministic(FFaker::GenderJP, :random)

  def setup
    @tester = FFaker::GenderJP
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

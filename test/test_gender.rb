# frozen_string_literal: true

require_relative 'helper'

class TestFakerGender < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Gender, :binary, :random)

  def setup
    @tester = FFaker::Gender
  end

  def test_random
    gender_regex = /\A(?:male|female|non-binary|agender|androgyne|bi-gender|pan-gender)\z/
    assert_match(gender_regex, @tester.random)
  end

  def test_binary
    gender_regex = /\A(?:male|female)\z/
    assert_match(gender_regex, @tester.binary)
  end
end

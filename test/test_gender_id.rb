# frozen_string_literal: true
# encoding: utf-8

require 'helper'

class TestFakerGenderID < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::GenderID, :random)

  def setup
    @tester = FFaker::GenderID
  end

  def test_random
    gender_regex = /\A(laki-laki|perempuan)\z/
    assert_match(gender_regex, @tester.random)
  end
end

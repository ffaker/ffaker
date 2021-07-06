# frozen_string_literal: true

require_relative 'helper'

class TestFakerGenderRU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::GenderRU, :binary, :random)

  def setup
    @tester = FFaker::GenderRU
  end

  def test_random
    gender_regex = /\A(?:мужчина|женщина|нонбайнари|агендер)\z/
    assert_match(gender_regex, @tester.random)
  end

  def test_binary
    gender_regex = /\A(?:мужчина|женщина)\z/
    assert_match(gender_regex, @tester.binary)
  end
end

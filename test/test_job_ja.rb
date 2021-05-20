# frozen_string_literal: true

require_relative 'helper'

class TestFakerJobJA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::JobJA, :title)

  def setup
    @tester = FFaker::JobJA
  end

  def test_title
    assert_greater_than_or_equal_to @tester.title.length, 1
  end

  def test_nouns
    assert_kind_of Array, @tester::JOB_NOUNS
  end
end

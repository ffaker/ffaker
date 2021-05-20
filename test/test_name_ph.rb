# frozen_string_literal: true

require_relative 'helper'

class TestFakerNamePH < Test::Unit::TestCase
  include DeterministicHelper

  PH_REGEXP = /\A([\wñÑú-]+\.? ?){2,5}\z/.freeze

  assert_methods_are_deterministic(
    FFaker::NamePH,
    :name, :last_name, :first_name, :prefix
  )

  def setup
    @tester = FFaker::NamePH
  end

  def test_name
    assert_match(PH_REGEXP, @tester.name)
  end

  def test_last_name
    assert_match(PH_REGEXP, @tester.last_name)
  end

  def test_first_name
    assert_match(PH_REGEXP, @tester.first_name)
  end

  def test_prefix
    assert_match(/\A[A-Z][a-z]+\.?\z/, @tester.prefix)
  end
end

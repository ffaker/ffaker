# frozen_string_literal: true

require_relative 'helper'

class TestCompanySE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::CompanySE,
    :name, :suffix
  )

  def test_name
    assert_match(/[ a-z]+/, FFaker::CompanySE.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, FFaker::CompanySE.suffix)
  end
end

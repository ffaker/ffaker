# frozen_string_literal: true

require_relative 'helper'

class TestFakerIdentificationES < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IdentificationES, :gender)

  def setup
    @tester = FFaker::IdentificationES
  end

  def test_gender
    assert_match(/(Hombre|Mujer)/, @tester.gender)
  end
end

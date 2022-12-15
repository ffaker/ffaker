# frozen_string_literal: true

require_relative 'helper'

class TestIdentificationEC < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IdentificationEC, :ci)

  def setup
    @tester = FFaker::IdentificationEC
  end

  def test_ci
    assert_match(/^[0-9]{10}$/, @tester.ci)
  end
end

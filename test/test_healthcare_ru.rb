# frozen_string_literal: true

require_relative 'helper'

class TestHealthcareRU < Test::Unit::TestCase
  include DeterministicHelper

  SPECIALIZATION_REGEX = /\A[А-Яа-я\ ()\-]+\z/.freeze

  assert_methods_are_deterministic(FFaker::HealthcareRU, :doctor_specialization)

  def setup
    @tester = FFaker::HealthcareRU
  end

  def test_doctor_specialization
    assert_match(SPECIALIZATION_REGEX, @tester.doctor_specialization)
  end
end

# frozen_string_literal: true

require_relative 'helper'

class TestFakerIdentificationFI < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::IdentificationFI,
    :identity_number
  )

  def setup
    @tester = FFaker::IdentificationFI
  end

  def test_identity_number
    general_regex = /^(0[1-9]|[1-2]\d|3[01])(0[1-9]|1[0-2])(\d\d)([-+A-FU-Y])(\d\d\d)([0-9A-FHJ-NPR-Y])$/
    assert_match(general_regex, @tester.identity_number)
    random_far_past_date = rand(Date.civil(1700)..Date.civil(1800))
    assert_raises ArgumentError do
      @tester.identity_number(birthday: random_far_past_date)
    end
    random_far_future_date = rand(Date.civil(2100)..Date.civil(2200))
    assert_raises ArgumentError do
      @tester.identity_number(birthday: random_far_future_date)
    end
    date_match_regex = /^010100A(\d\d\d)([0-9A-FHJ-NPR-Y])$/
    assert_match(date_match_regex, @tester.identity_number(birthday: Date.civil(2000, 1, 1)))
    fake_number_match_regex = /^(0[1-9]|[1-2]\d|3[01])(0[1-9]|1[0-2])(\d\d)([-+A-FU-Y])9(\d\d)([0-9A-FHJ-NPR-Y])$/
    assert_match(fake_number_match_regex, @tester.identity_number(fake: true))
    real_number_match_regex = /^(0[1-9]|[1-2]\d|3[01])(0[1-9]|1[0-2])(\d\d)([-+A-FU-Y])([0-8])(\d\d)([0-9A-FHJ-NPR-Y])$/
    assert_match(real_number_match_regex, @tester.identity_number(fake: false))
    female_match_regex = /^(0[1-9]|[1-2]\d|3[01])(0[1-9]|1[0-2])(\d\d)([-+A-FU-Y])(\d\d)([02468])([0-9A-FHJ-NPR-Y])$/
    assert_match(female_match_regex, @tester.identity_number(gender: 'female'))
    male_match_regex = /^(0[1-9]|[1-2]\d|3[01])(0[1-9]|1[0-2])(\d\d)([-+A-FU-Y])(\d\d)([13579])([0-9A-FHJ-NPR-Y])$/
    assert_match(male_match_regex, @tester.identity_number(gender: 'male'))
  end
end

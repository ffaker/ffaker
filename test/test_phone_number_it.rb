# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberIT < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberIT,
    :phone_number, :home_phone_number, :mobile_phone_number
  )
end

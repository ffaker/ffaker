# encoding: utf-8

require 'helper'

class TestPhoneNumer < Test::Unit::TestCase
  def test_phone_number
    assert_match /\d{3}[. -]\d{3}/, Faker::PhoneNumber.phone_number
  end

  def test_short_phone_number
    assert_match /\d{3}-\d{3}-\d{4}/, Faker::PhoneNumber.short_phone_number
  end
end

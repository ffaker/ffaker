# encoding: utf-8

require 'helper'

class TestPhoneNumer < Test::Unit::TestCase
  def test_phone_number
    assert_match /\d{3}[. -]\d{3}/, FFaker::PhoneNumber.phone_number
  end

  def test_short_phone_number
    assert_match /\d{3}-\d{3}-\d{4}/, FFaker::PhoneNumber.short_phone_number
  end

  def test_imei
    assert_match /^\d{15}$/, FFaker::PhoneNumber.imei
  end

  def test_imei_with_sn
    sn = rand(1_000_000)
    assert_match /^\d{8}#{sprintf('%06d', sn)}\d{1}$/, FFaker::PhoneNumber.imei(sn)
  end
end

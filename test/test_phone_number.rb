# encoding: utf-8

require 'helper'

class TestPhoneNumer < Test::Unit::TestCase
  def test_phone_number
    assert_match /\d{3}[. -]\d{3}/, FFaker::PhoneNumber.phone_number
  end

  def test_area_code
    assert_not_match /\A\d11\z/, FFaker::PhoneNumber.area_code.to_s
    assert_match /\A\d{3}\z/, FFaker::PhoneNumber.area_code.to_s
  end

  def test_short_phone_number
    assert_match /\A\d{3}-\d{3}-\d{4}\z/, FFaker::PhoneNumber.short_phone_number
  end

  def test_imei
    assert_match /\A\d{15}\z/, FFaker::PhoneNumber.imei
  end

  def test_imei_with_sn
    sn = rand(1_000_000)
    assert_match /\A\d{8}#{sprintf('%06d', sn)}\d{1}\z/, FFaker::PhoneNumber.imei(sn)
  end
end

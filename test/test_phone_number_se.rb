# encoding: utf-8

require 'helper'

class TestPhoneNumberSE < Test::Unit::TestCase

  def setup
    @tester = Faker::PhoneNumberSE
  end

  ALLOWED_CHARS = /[()\d +-]/

  def test_mobile_phone_prefix
    assert Faker::PhoneNumberSE::MOBILE_PHONE_PREFIX.include?(@tester.mobile_prefix)
  end

  def test_home_work_phone_prefix
    assert Faker::PhoneNumberSE::PHONE_PREFIX.include?(@tester.area_prefix)
  end

  def test_country_prefix
    assert Faker::PhoneNumberSE::COUNTRY_PREFIX.include?(@tester.country_prefix)
  end

  def test_mobile_phone_number
    assert_match ALLOWED_CHARS, Faker::PhoneNumberSE.mobile_phone_number
    assert_match(/\d{3}/, Faker::PhoneNumberSE.mobile_phone_number)
    assert Faker::PhoneNumberSE.mobile_phone_number.length > 9
  end

  def test_home_work_phone_number
    assert_match ALLOWED_CHARS, Faker::PhoneNumberSE.home_work_phone_number
    assert_match(/\d{1} \d{2}/, Faker::PhoneNumberSE.home_work_phone_number)
    assert Faker::PhoneNumberSE.mobile_phone_number.length > 9
  end

  def test_phone_number
    10.times do
      assert_match ALLOWED_CHARS, Faker::PhoneNumberSE.phone_number
    end
  end

  def test_international_mobile_phone_number
    assert_match(/46/, Faker::PhoneNumberSE.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/46/, Faker::PhoneNumberSE.international_home_work_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match ALLOWED_CHARS, Faker::PhoneNumberSE.international_phone_number
      assert_match(/46/, Faker::PhoneNumberSE.international_phone_number)
    end
  end

end



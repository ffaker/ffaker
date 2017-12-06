# frozen_string_literal: true
# encoding: utf-8

require 'helper'

# Author: wiseleyb<wiseleyb@gmail.com>
class TestPhoneNumberRU < Test::Unit::TestCase
  include DeterministicHelper

  def setup
    @tester = FFaker::PhoneNumberRU
  end

  def test_mobile_phone
    10.times do
      assert_match(/(\+7|8){1}\d{10}/, @tester.mobile_phone_number)
    end
  end

  def test_home_phone
    10.times do
      assert_match(/(\+7|8){1}\d{10}/, @tester.mobile_phone_number)
    end
  end
end

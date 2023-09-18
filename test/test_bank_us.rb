# frozen_string_literal: true

require_relative 'helper'

class TestBankUS < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::BankUS,
    :account_number, :routing_number
  )

  def setup
    @tester = FFaker::BankUS
  end

  def test_account_number
    assert_instance_of String, @tester.account_number
    assert_match(/\A\d{8}\z/, @tester.account_number(min_digits: 8, max_digits: 8))
    assert_match(/\A\d{12}\z/, @tester.account_number(min_digits: 12, max_digits: 12))
  end

  def test_routing_number
    routing_number = @tester.routing_number
    assert_match(/\A\d{9}\z/, routing_number)

    checksum = (
      (7 * (routing_number[0].to_i + routing_number[3].to_i + routing_number[6].to_i)) +
        (3 * (routing_number[1].to_i + routing_number[4].to_i + routing_number[7].to_i)) +
        (9 * (routing_number[2].to_i + routing_number[5].to_i + routing_number[8].to_i))
    )

    assert_equal(0, checksum % 10, 'The routing number\'s checksum is not a multiple of ten')
  end
end

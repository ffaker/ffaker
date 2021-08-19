# frozen_string_literal: true

require_relative 'helper'

class TestNumber < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Number, :number, :decimal)

  def setup
    @tester = FFaker::Number
  end

  def test_number
    assert @tester.number.is_a?(Integer)
    assert @tester.number.digits.count == 1
    assert @tester.number(digits: 3).digits.count == 3
    assert_match(/\d/, @tester.number.to_s)
    assert_match(/\d{3}/, @tester.number(digits: 3).to_s)
  end

  def test_number_when_invalid_argument
    assert_raise(ArgumentError.new('Digits cannot be less than 1')) { @tester.number(digits: 0) }
  end

  def test_decimal
    assert @tester.decimal.is_a?(Float)

    whole_digits = rand(2..5)
    fractional_digits = rand(2..5)
    decimal = @tester.decimal(whole_digits: whole_digits, fractional_digits: fractional_digits)
    assert decimal.to_s.split('.').first.size == whole_digits
    assert decimal.to_s.split('.').last.size == fractional_digits
  end

  def test_decimal_when_invalid_argument
    assert_raise(ArgumentError.new('Digits cannot be less than 1')) do
      @tester.decimal(whole_digits: 0)
    end

    assert_raise(ArgumentError.new('Digits cannot be less than 1')) do
      @tester.decimal(fractional_digits: 0)
    end
  end
end

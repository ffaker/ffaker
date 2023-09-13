# frozen_string_literal: true

require_relative 'helper'

class TestIdentificationEC < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IdentificationEC, :ci)

  def setup
    @tester = FFaker::IdentificationEC
  end

  def test_ci
    assert_match(/^[0-9]{10}$/, @tester.ci)
  end

  def test_last_digit
    ci = @tester.ci
    sum = 0
    ci[0..8].chars.each_with_index do |char, index|
      if index.even?
        multiple = char.to_i * 2
        sum += multiple > 9 ? multiple - 9 : multiple
      else
        sum += char.to_i
      end
    end
    mod = sum % 10
    mod = 10 - mod if mod.positive?
    assert(ci[9].to_i == mod)
  end
end

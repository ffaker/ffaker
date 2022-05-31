# frozen_string_literal: true

require_relative 'helper'

class TestFakerDate < Test::Unit::TestCase
  include DeterministicHelper

  def setup
    @tester = FFaker::Date
  end

  assert_methods_are_deterministic(FFaker::Date, :backward, :forward)

  def test_between
    from = Date.new(2015, 1, 1)
    to   = Date.new(2016, 12, 31)

    assert_random_between(from..to) { @tester.between(from, to) }
    assert_instance_of Date, @tester.between(from, to)
  end

  def test_backward
    today = Date.today

    assert_random_between(today - 365..today - 1) { @tester.backward }
    assert_random_between(today - 30..today - 1) { @tester.backward(30) }
    assert_instance_of Date, @tester.backward
  end

  def test_forward
    today = Date.today

    assert_random_between(today + 1..today + 365) { @tester.forward }
    assert_random_between(today + 1..today + 30) { @tester.forward(30) }
    assert_instance_of Date, @tester.forward
  end
end

# frozen_string_literal: true

require_relative 'helper'

class TestBoolean < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Boolean, :maybe, :boolean)

  def test_maybe
    maybe = FFaker::Boolean.maybe
    assert [true, false].include?(maybe)
  end

  def test_boolean_with_default_ratio
    true_count = 0
    1000.times do
      true_count += 1 if FFaker::Boolean.boolean
    end
    assert_in_delta 0.5, true_count / 1000.0, 0.1
  end

  def test_boolean_with_true_ratio
    true_ratio = 0.8
    true_count = 0
    1000.times do
      true_count += 1 if FFaker::Boolean.boolean(true_ratio: true_ratio)
    end
    assert_in_delta true_ratio, true_count / 1000.0, 0.1
  end

  def test_boolean_with_true_ratio_zero
    true_ratio = 0
    100.times do
      assert_equal false, FFaker::Boolean.boolean(true_ratio: true_ratio)
    end
  end

  def test_boolean_with_true_ratio_one
    true_ratio = 1
    100.times do
      assert_equal true, FFaker::Boolean.boolean(true_ratio: true_ratio)
    end
  end
end

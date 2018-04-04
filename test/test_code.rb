# encoding: utf-8
# frozen_string_literal: true

require 'helper'

class TestCode < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Code, :ean)

  def test_ean
    assert FFaker::Code.ean.match(/^\d{13}$/)
  end

  def test_ean_deterministic
    FFaker::Random.seed = 10
    assert_equal FFaker::Code.ean, '1399378750693'
  end
end

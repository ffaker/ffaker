# encoding: utf-8

require 'helper'

class TestCurrency < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Currency,
    :code, :name
  )
end

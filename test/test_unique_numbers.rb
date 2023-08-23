# frozen_string_literal: true

require_relative 'helper'

class TestUniqueNumbers < Test::Unit::TestCase
  def test_generates_unique_numbers
    assert_nothing_raised { FFaker::Number.unique.number(digits: 1) }
  end
end

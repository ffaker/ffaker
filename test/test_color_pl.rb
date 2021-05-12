# frozen_string_literal: true

require_relative 'helper'

class TestColorPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::ColorPL, :name)

  def test_name
    assert_match(/\A[a-ząćęłńóśźżé]+\z/, FFaker::ColorPL.name)
  end
end

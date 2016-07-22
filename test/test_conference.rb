# encoding: utf-8

require 'helper'

class TestConference < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Conference, :name)

  def test_name
    assert_match(/1\+|[ a-z]+/i, FFaker::Conference.name)
  end
end

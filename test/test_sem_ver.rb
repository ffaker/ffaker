# frozen_string_literal: true

require_relative 'helper'

class TestSemVer < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SemVer, :next)

  def setup
    @tester = FFaker::SemVer
  end

  def test_next
    assert_includes(%w[0.0.1 0.1.0 1.0.0], @tester.next)
    assert_includes(%w[2.0.0 1.3.0 1.2.4], @tester.next('1.2.3'))
  end
end

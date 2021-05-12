# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameKR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameKR,
    :name, :last_name, :name_with_space
  )

  def setup
    @tester = FFaker::NameKR
  end

  def test_name
    assert_match(/\A[가-힣]{2,}\z/, @tester.name)
  end

  def test_last_first
    assert_match(/\A[가-힣]{2,}\z/, @tester.last_first)
  end

  def test_name_with_space
    assert_match(/\A[가-힣]{1,2} [가-힣]{2,}\z/, @tester.name_with_space)
  end
end

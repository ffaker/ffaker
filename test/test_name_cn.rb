# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameCN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameCN,
    :name, :first_name, :last_name
  )

  def setup
    @tester = FFaker::NameCN
  end

  def test_name
    assert_match(/\A.{2,}\z/, @tester.name)
  end

  def test_first_name
    assert_match(/\A.{1,2}\z/, @tester.first_name)
  end

  def test_last_name
    assert_match(/\A.{1,5}\z/, @tester.last_name)
  end
end

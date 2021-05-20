# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameTW < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameTW,
    :last_name, :first_name, :name
  )

  def setup
    @tester = FFaker::NameTW
  end

  def test_last_name
    assert_include @tester::LAST_NAMES, @tester.last_name
  end

  def test_first_name
    assert_include @tester::FIRST_NAMES, @tester.first_name
  end

  def test_name
    assert_match(/\A.{2,}\z/, @tester.name)
  end
end

# frozen_string_literal: true

require_relative 'helper'

class TestGame < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Game,
    :title, :category, :mechanic
  )

  def setup
    @tester = FFaker::Game
  end

  def test_title
    assert_match(/[\sa-z]+/, @tester.title)
  end

  def test_category
    assert_match(%r{[\w\s'/]+}, @tester.category)
  end

  def test_mechanic
    assert_match(/[\sa-z]+/, @tester.mechanic)
  end
end

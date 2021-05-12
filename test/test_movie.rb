# frozen_string_literal: true

require_relative 'helper'

class TestMovie < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Movie, :title, :rating)

  def setup
    @tester = FFaker::Movie
  end

  def test_title
    assert_match(/[ a-z]+/, FFaker::Movie.title)
  end

  def test_rating
    assert FFaker::Movie::RATINGS.include? @tester.rating
  end
end

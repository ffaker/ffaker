# frozen_string_literal: true

require_relative 'helper'

class TestBook < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Book,
    :title, :genre, :author, :isbn, :description, :cover
  )

  def setup
    @tester = FFaker::Book
  end

  def test_title
    assert_match(/[\sa-z]+/, @tester.title)
  end

  def test_genre
    assert_match(%r{[\w\s'/]+}, @tester.genre)
  end

  def test_author
    assert_match(/[\sa-z]+/, @tester.author)
  end

  def test_isbn
    assert_match(/\d+/, @tester.isbn)
  end

  def test_description
    assert_match(/[\sa-z]+/, @tester.description)
  end

  def test_cover
    assert_match(%r{\Ahttps://robohash\.org/.+\.png\?size=300x300\z},
                 @tester.cover)
  end

  def test_orly_cover
    assert_match(%r{\Ahttps://orly-appstore\.herokuapp\.com/generate},
                 @tester.orly_cover)
  end
end

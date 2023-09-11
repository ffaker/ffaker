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

  def test_cover_with_format
    assert_match(%r{\Ahttps://robohash\.org/.+\.jpg\?size=300x300\z},
                 @tester.cover(format: 'jpg'))
  end

  def test_cover_output_with_keyword_arguments
    output = capture_output do
      @tester.cover(format: 'jpg')
    end

    assert_equal ['', ''], output
  end

  def test_cover_with_slug_as_positional_argument
    assert_match(%r{\Ahttps://robohash\.org/foobar\.png\?size=300x300\z},
                 @tester.cover('foobar'))
  end

  def test_cover_output_with_positional_arguments
    output = capture_output do
      @tester.cover('foobar')
    end

    assert_equal(
      ['', "Positional arguments for Book#cover are deprecated. Please use keyword arguments.\n"],
      output
    )
  end

  def test_orly_cover
    assert_match(%r{\Ahttps://orly-appstore\.herokuapp\.com/generate},
                 @tester.orly_cover)
  end
end

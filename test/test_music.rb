# frozen_string_literal: true

require_relative 'helper'

class TestMusic < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Music,
    :genre, :album, :artist, :song
  )

  def test_genre
    assert_match(%r{[A-z]|\W|&/+}, FFaker::Music.genre)
  end

  def test_album
    assert_match(/\s|[A-z]|\W|\d|'|\?+/, FFaker::Music.album)
  end

  def test_artist
    assert_match(/\s|[A-z]|\W|\d|'|\?|&|\+|\.|-+/, FFaker::Music.artist)
  end

  def test_song
    assert_match(/\s|[A-z]|\W|\d|'|\?|&|\+|\.|-+/, FFaker::Music.song)
  end
end

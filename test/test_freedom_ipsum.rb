# frozen_string_literal: true

require_relative 'helper'
class TestFreedomIpsum < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::FreedomIpsum,
    :word, :words
  )

  TEST_REGEX = /[a-z0-9 -]+/i.freeze

  def test_words
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.words.join(' '))
  end

  def test_word
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.word)
  end
end

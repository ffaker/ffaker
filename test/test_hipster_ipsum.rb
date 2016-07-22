# encoding: utf-8

require 'helper'

class TestHipsterIpsum < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::HipsterIpsum,
    :paragraph, :paragraphs, :sentence, :sentences, :word, :words
  )

  TEST_REGEX = /\+1|[ a-z]+/i

  def test_paragraph
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.paragraph)
  end

  def test_sentence
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.sentence)
  end

  def test_paragraphs
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.sentences.join(' '))
  end

  def test_words
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.words.join(' '))
  end

  def test_word
    assert_match(TEST_REGEX, FFaker::HipsterIpsum.word)
  end
end

# encoding: UTF-8
# frozen_string_literal: true

require 'helper'

class TestFakerLoremPL < Test::Unit::TestCase
  include DeterministicHelper

  POLISH_WORD_MATCHER = /\A[A-Ża-ż\s]+\z/
  POLISH_SENTENCE_MATCHER = /\A[A-Ża-ż\s\.\!\?,]+\z/

  assert_methods_are_deterministic(
    FFaker::LoremPL,
    :character, :characters, :word, :words,
    :sentence, :sentences, :paragraph, :paragraphs
  )

  def setup
    @tester = FFaker::LoremPL
  end

  def test_word
    assert_match(POLISH_WORD_MATCHER, @tester.word)
  end

  def test_words
    @tester.words(10).each do |word|
      assert_match(POLISH_WORD_MATCHER, word)
    end
  end

  def test_sentence
    assert_match(POLISH_SENTENCE_MATCHER, @tester.sentence(20))
    assert_match(POLISH_SENTENCE_MATCHER, @tester.sentence(4))
  end

  def test_sentences
    @tester.sentences(10).each do |sentence|
      assert_match(POLISH_SENTENCE_MATCHER, sentence)
    end
  end

  def test_paragraph
    assert_match(POLISH_SENTENCE_MATCHER, @tester.paragraph)
  end

  def test_paragraphs
    @tester.paragraphs.each do |paragraph|
      assert_match(POLISH_SENTENCE_MATCHER, paragraph)
    end
  end
end

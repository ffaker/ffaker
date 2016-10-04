# encoding: utf-8

require 'helper'

class TestLoremKR < Test::Unit::TestCase
  include DeterministicHelper

  KOREAN_SENTENCE_MATCHER = /\A[ .가-힣]+\z/
  KOREAN_WORDS_MATCHER = /\A[ 가-힣]+\z/
  KOREAN_WORD_MATCHER = /\A[가-힣]+\z/

  assert_methods_are_deterministic(
    FFaker::LoremKR,
    :paragraph, :paragraphs, :sentence, :sentences,
    :phrase, :phrases, :word, :words
  )

  def setup
    @tester = FFaker::LoremKR
  end

  def test_paragraph
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.paragraph)
  end

  def test_sentence
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.sentence)
    assert_nothing_thrown do
      100.times { @tester.sentence 0 }
    end
  end

  def test_phrase
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.phrase)
  end

  def test_paragraphs
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.sentences.join(' '))
  end

  def test_phrases
    assert_match(KOREAN_SENTENCE_MATCHER, @tester.phrases.join(' '))
  end

  def test_words
    assert_match(KOREAN_WORDS_MATCHER, @tester.words.join(' '))
  end

  def test_word
    assert_match(KOREAN_WORD_MATCHER, @tester.word)
  end
end

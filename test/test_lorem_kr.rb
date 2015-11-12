require 'test_helper'

class TestLoremKR < Minitest::Test
  KOREAN_SENTENCE_MATCHER = /\A[ .가-힣]+\z/
  KOREAN_WORDS_MATCHER = /\A[ 가-힣]+\z/
  KOREAN_WORD_MATCHER = /\A[가-힣]+\z/
  def setup
    @tester = FFaker::LoremKR
  end

  def test_paragraph
    assert_match KOREAN_SENTENCE_MATCHER, @tester.paragraph
  end

  def test_sentence
    assert_match KOREAN_SENTENCE_MATCHER, @tester.sentence
  end

  def test_phrase
    assert_match KOREAN_SENTENCE_MATCHER, @tester.phrase
  end

  def test_paragraphs
    assert_match KOREAN_SENTENCE_MATCHER, @tester.paragraphs.join(" ")
  end

  def test_sentences
    assert_match KOREAN_SENTENCE_MATCHER, @tester.sentences.join(" ")
  end

  def test_phrases
    assert_match KOREAN_SENTENCE_MATCHER, @tester.phrases.join(" ")
  end

  def test_words
    assert_match KOREAN_WORDS_MATCHER, @tester.words.join(" ")
  end

  def test_word
    assert_match KOREAN_WORD_MATCHER, @tester.word
  end
end

require 'helper'

class TestFreedomIpsum < Test::Unit::TestCase
  TEST_REGEX = /\+1|[ a-z]+/i

  def test_paragraph
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.paragraph)
  end

  def test_sentence
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.sentence)
  end

  def test_paragraphs
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.paragraphs.join(' '))
  end

  def test_sentences
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.sentences.join(' '))
  end

  def test_words
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.words.join(' '))
  end

  def test_word
    assert_match(TEST_REGEX, FFaker::FreedomIpsum.word)
  end
end